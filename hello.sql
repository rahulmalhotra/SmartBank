-- MySQL Script generated by MySQL Workbench
-- Sat Aug 19 19:02:17 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema smartbank
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema smartbank
-- -----------------------------------------------------
USE `id2625207_smartbank` ;

-- -----------------------------------------------------
-- Table `smartbank`.`user_profile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `id2625207_smartbank`.`user_profile` (
  `userid` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `smartbank`.`bank_profile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `id2625207_smartbank`.`bank_profile` (
  `bankid` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `phone` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `address` LONGTEXT NULL,
  `endpoint` LONGTEXT NULL,
  `threshold` VARCHAR(45) NULL,
  `timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bankid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `smartbank`.`document`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `id2625207_smartbank`.`document` (
  `documentid` INT NOT NULL AUTO_INCREMENT,
  `image` LONGTEXT NULL,
  `status` INT NULL,
  `type` VARCHAR(45) NULL,
  `accountnumber` VARCHAR(45) NULL,
  `userid` INT NULL,
  `bankid` INT NULL,
  `timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`documentid`),
  INDEX `fuserid_idx` (`userid` ASC),
  INDEX `fbankid_idx` (`bankid` ASC),
  CONSTRAINT `dfuserid`
    FOREIGN KEY (`userid`)
    REFERENCES `id2625207_smartbank`.`user_profile` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `dfbankid`
    FOREIGN KEY (`bankid`)
    REFERENCES `id2625207_smartbank`.`bank_profile` (`bankid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `smartbank`.`user_accounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `id2625207_smartbank`.`user_accounts` (
  `accountid` INT NOT NULL AUTO_INCREMENT,
  `number` VARCHAR(45) NULL,
  `type` VARCHAR(45) NULL,
  `status` INT NULL,
  `userid` INT NULL,
  `bankid` INT NULL,
  `ifsccode` VARCHAR(45) NULL,
  `timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`accountid`),
  INDEX `afuserid_idx` (`userid` ASC),
  INDEX `afbankid_idx` (`bankid` ASC),
  CONSTRAINT `afuserid`
    FOREIGN KEY (`userid`)
    REFERENCES `id2625207_smartbank`.`user_profile` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `afbankid`
    FOREIGN KEY (`bankid`)
    REFERENCES `id2625207_smartbank`.`bank_profile` (`bankid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
