-- MySQL Script generated by MySQL Workbench
-- 03/21/18 07:40:10
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema trgovina
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `trgovina` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `trgovina` ;

-- -----------------------------------------------------
-- Table `trgovina`.`uporabniki`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trgovina`.`uporabniki` (
  `iduporabniki` INT NOT NULL AUTO_INCREMENT,
  `ime` VARCHAR(45) NULL,
  `geslo` VARCHAR(45) NULL,
  `admin` TINYINT(1) NULL,
  PRIMARY KEY (`iduporabniki`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trgovina`.`artikel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trgovina`.`artikel` (
  `idartikel` INT NOT NULL AUTO_INCREMENT,
  `opis` VARCHAR(45) NULL,
  `ime` VARCHAR(45) NULL,
  `cena` DECIMAL(10,2) NULL,
  `zaloga` INT NULL,
  `slika` MEDIUMTEXT NULL,
  PRIMARY KEY (`idartikel`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trgovina`.`kosarica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trgovina`.`kosarica` (
  `idkosarica` INT NOT NULL AUTO_INCREMENT,
  `artikel_idartikel` INT NOT NULL,
  `uporabniki_iduporabniki` INT NOT NULL,
  PRIMARY KEY (`idkosarica`),
  INDEX `fk_kosarica_artikel_idx` (`artikel_idartikel` ASC),
  INDEX `fk_kosarica_uporabniki1_idx` (`uporabniki_iduporabniki` ASC),
  CONSTRAINT `fk_kosarica_artikel`
    FOREIGN KEY (`artikel_idartikel`)
    REFERENCES `trgovina`.`artikel` (`idartikel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_kosarica_uporabniki1`
    FOREIGN KEY (`uporabniki_iduporabniki`)
    REFERENCES `trgovina`.`uporabniki` (`iduporabniki`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
