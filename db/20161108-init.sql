-- MySQL Script generated by MySQL Workbench
-- 11/08/16 12:29:00
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema emotion_hunt
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `emotion_hunt` ;

-- -----------------------------------------------------
-- Schema emotion_hunt
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `emotion_hunt` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `emotion_hunt` ;

-- -----------------------------------------------------
-- Table `emotion_hunt`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `emotion_hunt`.`user` ;

CREATE TABLE IF NOT EXISTS `emotion_hunt`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `phone_number` VARCHAR(15) NOT NULL,
  `android_id` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NULL,
  `profile_picture` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emotion_hunt`.`emotion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `emotion_hunt`.`emotion` ;

CREATE TABLE IF NOT EXISTS `emotion_hunt`.`emotion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `lat` DECIMAL(10,8) NOT NULL,
  `lon` DECIMAL(11,8) NOT NULL,
  `is_public` TINYINT(1) NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NOT NULL,
  `visibility_duration` INT NULL,
  `text` VARCHAR(255) NULL,
  `filename` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emotion_hunt`.`user_emotion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `emotion_hunt`.`user_emotion` ;

CREATE TABLE IF NOT EXISTS `emotion_hunt`.`user_emotion` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `emotion_id` INT NOT NULL,
  `is_sender` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_user_has_emotion_emotion1_idx` (`emotion_id` ASC),
  INDEX `fk_user_has_emotion_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_emotion_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `emotion_hunt`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_emotion_emotion`
    FOREIGN KEY (`emotion_id`)
    REFERENCES `emotion_hunt`.`emotion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emotion_hunt`.`reaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `emotion_hunt`.`reaction` ;

CREATE TABLE IF NOT EXISTS `emotion_hunt`.`reaction` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_emotion_id` INT NOT NULL,
  `is_empty` TINYINT(1) NOT NULL DEFAULT 0,
  `anger` DECIMAL(10,9) NULL,
  `contempt` DECIMAL(10,9) NULL,
  `disgust` DECIMAL(10,9) NULL,
  `fear` DECIMAL(10,9) NULL,
  `happiness` DECIMAL(10,9) NULL,
  `neutral` DECIMAL(10,9) NULL,
  `sadness` DECIMAL(10,9) NULL,
  `surprise` DECIMAL(10,9) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_reaction_user_emotion1_idx` (`user_emotion_id` ASC),
  CONSTRAINT `fk_reaction_user_emotion`
    FOREIGN KEY (`user_emotion_id`)
    REFERENCES `emotion_hunt`.`user_emotion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `emotion_hunt`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `emotion_hunt`;
INSERT INTO `emotion_hunt`.`user` (`id`, `phone_number`, `android_id`, `name`, `profile_picture`) VALUES (1, '0041796957113', '866695021238407', 'Dimitri', NULL);
INSERT INTO `emotion_hunt`.`user` (`id`, `phone_number`, `android_id`, `name`, `profile_picture`) VALUES (2, '0041764924715', '353490069376560', 'Benji', NULL);

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
