-- MySQL dump 10.13  Distrib 8.0.15, for Linux (x86_64)
--
-- Host: localhost    Database: class2
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES default ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*SET character_set_client = default ;*/
CREATE TABLE `account` (
  `account_number` varchar(45) NOT NULL,
  `branch_name` varchar(45) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  PRIMARY KEY (`account_number`)
) ENGINE=InnoDB ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('A-101','Downtown',500),('A-102','Perryridge',400),('A-201','Brighton',900),('A-215','Mianus',700),('A-217','Brighton',750),('A-222','Redwood',700),('A-305','Round Hill',350);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower`
--

DROP TABLE IF EXISTS `borrower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;

CREATE TABLE `borrower` (
  `customer_name` varchar(45) NOT NULL,
  `loan_number` varchar(45) NOT NULL
) ENGINE=InnoDB ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower`
--

LOCK TABLES `borrower` WRITE;
/*!40000 ALTER TABLE `borrower` DISABLE KEYS */;
INSERT INTO `borrower` VALUES ('Adams','L-16'),('Curry','L-93'),('Hayes','L-15'),('Jackson','L-14'),('Jones','L-17'),('Smith','L-11'),('Williams','L-17'),('Smith','L-23');
/*!40000 ALTER TABLE `borrower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;

CREATE TABLE `branch` (
  `branch_name` varchar(45) NOT NULL,
  `branch_city` varchar(45) DEFAULT NULL,
  `assets` int(11) DEFAULT NULL,
  PRIMARY KEY (`branch_name`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES ('Brighton','Brooklyn',7100000),('Downtown','Brooklyn',9000000),('Mianus','Horseneck',400000),('North Town','Rye',3700000),('Perryridge','Horseneck',1700000),('Pownal','Bennington',300000),('Redwood','Palo Alto',2100000),('Round Hill','Horseneck',8000000);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;

CREATE TABLE `customer` (
  `customer_name` varchar(45) NOT NULL,
  `customer_street` varchar(45) DEFAULT NULL,
  `customer_city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customer_name`)
) ENGINE=InnoDB ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('Adams','Spring','Pittsfield'),('Brooks','Senator','Brooklyn'),('Curry','North','Rye'),('Glenn','Sand Hill','Woodside'),('Green','Walnut','Stamford'),('Hayes','Main Street','Harrison'),('Johnson','Alma','Palo Alto'),('Jones','Main','Harrison'),('Lindsay','Park','Pittsfield'),('Smith','North','Rye'),('Turner','Putnam','Stamford'),('Williams','Nassau','Princeton');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depositor`
--

DROP TABLE IF EXISTS `depositor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;

CREATE TABLE `depositor` (
  `customer_name` varchar(45) NOT NULL,
  `account_number` varchar(45) DEFAULT NULL
) ENGINE=InnoDB ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depositor`
--

LOCK TABLES `depositor` WRITE;
/*!40000 ALTER TABLE `depositor` DISABLE KEYS */;
INSERT INTO `depositor` VALUES ('Hayes','A-102'),('Johnson','A-101'),('Jones','A-217'),('Lindsay','A-222'),('Smith','A-215'),('Turner','A-305');
/*!40000 ALTER TABLE `depositor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;

CREATE TABLE `loan` (
  `loan_number` varchar(45) NOT NULL,
  `branch_name` varchar(45) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`loan_number`),
  KEY `branch_name_idx` (`branch_name`),
  CONSTRAINT `branch_name` FOREIGN KEY (`branch_name`) REFERENCES `branch` (`branch_name`)
) ENGINE=InnoDB ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES ('L-11','Round Hill',900),('L-14','Downtown',1500),('L-15','Perryridge',1500),('L-16','Perryridge',1300),('L-17','Downtown',1000),('L-23','Redwood',2000),('L-93','Mianus',500);
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-13 20:47:00
