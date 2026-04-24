CREATE DATABASE  IF NOT EXISTS `juice_shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `juice_shop`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: juice_shop
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `BillID` int NOT NULL,
  `TotalAmount` int DEFAULT NULL,
  `PayState` varchar(20) DEFAULT NULL,
  `BillDate` date DEFAULT NULL,
  PRIMARY KEY (`BillID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL,
  `Fname` varchar(15) DEFAULT NULL,
  `Lname` varchar(15) DEFAULT NULL,
  `SSN` int DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `position` varchar(15) DEFAULT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `SSN` (`SSN`),
  CONSTRAINT `employee_chk_1` CHECK ((`gender` in (_utf8mb4'male',_utf8mb4'female')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (20241,'Ali','Al-Otaibi',1110098765,'male','manager',15000.00),(20242,'Fahad','Al-Shahrani',1112375489,'male','Barista',7000.00),(20243,'Yara','alsharif',1113567953,'female','Accountant',4000.00),(20244,'omar','Al-Ghamdi',1115436789,'male','item-keeper',2500.00);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `handel`
--

DROP TABLE IF EXISTS `handel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `handel` (
  `employee_id` int NOT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`employee_id`,`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `handel`
--

LOCK TABLES `handel` WRITE;
/*!40000 ALTER TABLE `handel` DISABLE KEYS */;
INSERT INTO `handel` VALUES (20242,101),(20242,102),(20242,103),(20242,104),(20242,105),(20243,101),(20243,102),(20243,103),(20243,104),(20243,105);
/*!40000 ALTER TABLE `handel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juice`
--

DROP TABLE IF EXISTS `juice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juice` (
  `JuiceID` int NOT NULL,
  `JuiceName` varchar(50) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`JuiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juice`
--

LOCK TABLES `juice` WRITE;
/*!40000 ALTER TABLE `juice` DISABLE KEYS */;
INSERT INTO `juice` VALUES (1,'Orange ',5.99),(2,'Apple ',9.99),(3,'Grape ',3.49),(4,'Mango ',6.99),(5,'Strawberry Juice',7.99);
/*!40000 ALTER TABLE `juice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderjuices`
--

DROP TABLE IF EXISTS `orderjuices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderjuices` (
  `OrderID` int DEFAULT NULL,
  `JuiceID` int DEFAULT NULL,
  KEY `OrderID` (`OrderID`),
  KEY `JuiceID` (`JuiceID`),
  CONSTRAINT `orderjuices_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `orderjuices_ibfk_2` FOREIGN KEY (`JuiceID`) REFERENCES `juice` (`JuiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderjuices`
--

LOCK TABLES `orderjuices` WRITE;
/*!40000 ALTER TABLE `orderjuices` DISABLE KEYS */;
INSERT INTO `orderjuices` VALUES (101,1),(101,2),(101,3),(102,2),(102,5),(103,3),(104,5),(105,5);
/*!40000 ALTER TABLE `orderjuices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL,
  `OrderDate` date DEFAULT NULL,
  `OrderQuantity` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (101,'2024-02-05',10),(102,'2024-02-04',5),(103,'2024-02-03',8),(104,'2024-02-03',3),(105,'2024-02-07',4);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-07 22:54:12
