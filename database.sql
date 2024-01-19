-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: lib_resource
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog` (
  `catalog_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `au_first` varchar(25) DEFAULT NULL,
  `au_last` varchar(25) NOT NULL,
  `pub_year` smallint DEFAULT NULL,
  `lang` char(3) DEFAULT NULL,
  `oclc` int DEFAULT NULL,
  PRIMARY KEY (`catalog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog`
--

LOCK TABLES `catalog` WRITE;
/*!40000 ALTER TABLE `catalog` DISABLE KEYS */;
INSERT INTO `catalog` VALUES (23,'Cryptomenysis Patefacta','John','Falconer',1685,'ENG',606585728),(24,'Daemonolatreia Libri Tres','Nicholas','Rémy',1595,'LAT',311085466),(25,'De Furtivis Literarum Notis','Giovanni Battista','della Porta',1563,'LAT',16719979),(26,'De Lapide Philosophico','Johannes Isaac','Hollandus',1595,'LAT',879589849),(27,'Image du Monde','Gauthier','de Metz',1527,'FRE',42414566),(28,'Clavis Sapientiae',NULL,'Artephius',1609,'ARA',1066367904),(29,'Kryptographik','Johann Ludwig','Klüber',1809,'GER',46467736),(30,'Liber Investigationis',NULL,'Geber',1531,'LAT',956056936),(31,'Polygraphia','Johannes','Trithemius',1518,'LAT',257482238),(32,'Regnum Congo','Filippo','Pigafetta',1591,'LAT',80434604),(33,'Sadducismus Triumphatus','Joseph','Glanvill',1726,'ENG',3640460),(34,'Thesaurus Chemicus','Roger','Bacon',1620,'LAT',181688445),(35,'Traicté des Chiffres','Blaise','de Vigenère',1586,'FRE',1167456808),(36,'Turba Philosophorum',NULL,'Unkown',1613,'GER',46414912),(37,'The Witch-Cult in Western Europe','Margaret Alice','Murray',1921,'LAT',1178692),(38,'De Masticatione Mortuorum in Tumulis','Michael','Ranft',1728,'LAT',78751514),(39,'Wonders of the Invisible World','Cotton','Mather',1693,'ENG',10944967),(40,'Magnalia Christi Americana','Cotton','Mather',1702,'ENG',82194775),(41,'Ars Magna et Ultima','Ramon','Llull',1517,'DUT',60619982),(42,'The Story of Atlantis','William','Scott-Elliot',1896,'ENG',2355507),(43,'The Lost Lemuria','William','Scott-Elliot',1904,'ENG',973681006),(44,'Clavis Alchimiae','Robert','Fludd',1633,'LAT',18208056);
/*!40000 ALTER TABLE `catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `catalog_id` int NOT NULL,
  `location_id` smallint NOT NULL,
  `available` tinyint(1) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `catalog_id` (`catalog_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`catalog_id`),
  CONSTRAINT `item_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (100,23,4,1),(101,24,4,0),(102,25,4,0),(103,26,3,1),(104,27,4,0),(105,28,3,1),(106,29,3,1),(107,30,3,1),(108,31,4,0),(109,32,4,1),(110,33,1,1),(111,34,3,1),(112,35,3,0),(113,36,4,0),(114,37,1,1),(115,38,4,1),(116,39,1,1),(117,40,1,0),(118,41,3,0),(119,42,2,1),(120,43,2,1),(121,44,3,1),(122,42,3,1),(123,43,3,1),(124,37,3,1),(125,40,4,1);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_id` smallint NOT NULL AUTO_INCREMENT,
  `loc_name` varchar(50) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zip` char(5) DEFAULT NULL,
  `type` enum('library','archive','museum') DEFAULT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Newburyport Historical Society','98 High Street','Newburyport','MA','01950','archive'),(2,'Newburyport Public Library','94 State St','Newburyport','MA','01950','library'),(3,'Miskatonic Unversity Library','13 Aylesbury Ln','Arkham','MA','01984','library'),(4,'Miskatonic University Museum','6 Garrison Ave','Arkham','MA','01984','museum');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-10 22:04:26
