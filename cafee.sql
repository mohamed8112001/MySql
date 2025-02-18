-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: cafee
-- ------------------------------------------------------
-- Server version	8.0.41-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `All_Products`
--

DROP TABLE IF EXISTS `All_Products`;
/*!50001 DROP VIEW IF EXISTS `All_Products`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `All_Products` AS SELECT 
 1 AS `Product`,
 1 AS `price`,
 1 AS `image`,
 1 AS `Action`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `All_Users`
--

DROP TABLE IF EXISTS `All_Users`;
/*!50001 DROP VIEW IF EXISTS `All_Users`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `All_Users` AS SELECT 
 1 AS `Name`,
 1 AS `Room`,
 1 AS `image`,
 1 AS `Ext`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Amount`
--

DROP TABLE IF EXISTS `Amount`;
/*!50001 DROP VIEW IF EXISTS `Amount`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Amount` AS SELECT 
 1 AS `order_id`,
 1 AS `date`,
 1 AS `total_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!50001 DROP VIEW IF EXISTS `Orders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Orders` AS SELECT 
 1 AS `Order_Date`,
 1 AS `Name`,
 1 AS `Room`,
 1 AS `Ext`,
 1 AS `Action`,
 1 AS `Total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Total_amount`
--

DROP TABLE IF EXISTS `Total_amount`;
/*!50001 DROP VIEW IF EXISTS `Total_amount`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Total_amount` AS SELECT 
 1 AS `name`,
 1 AS `date`,
 1 AS `total_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `amount`
--

DROP TABLE IF EXISTS `amount`;
/*!50001 DROP VIEW IF EXISTS `amount`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `amount` AS SELECT 
 1 AS `total_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` tinyint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Hot Drinks'),(2,'Hot Drinks'),(3,'Cold Drinks');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `order_id` tinyint NOT NULL,
  `product_id` tinyint NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `fk_product` (`product_id`),
  CONSTRAINT `fk_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON UPDATE CASCADE,
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_table` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,1,2),(1,2,3),(2,2,3),(3,1,1),(4,5,3),(5,7,1);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_table`
--

DROP TABLE IF EXISTS `order_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_table` (
  `order_id` tinyint NOT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `action` varchar(100) DEFAULT NULL,
  `note` varchar(50) DEFAULT NULL,
  `user_id` tinyint DEFAULT NULL,
  `room_id` tinyint DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_table`
--

LOCK TABLES `order_table` WRITE;
/*!40000 ALTER TABLE `order_table` DISABLE KEYS */;
INSERT INTO `order_table` VALUES (1,'2025-02-18','Pending','Cancel','No sugar in coffee',1,1),(2,'2025-02-18','Completed','Deliver','Extra milk for tea',2,2),(3,'2025-02-18','In Progress','Deliver','Add more sugar',3,1),(4,'2025-02-18','Pending','Deliver','Less Sugar',4,2),(5,'2025-02-18','Pending','Delever','No sugar in coffee',1,2);
/*!40000 ALTER TABLE `order_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamed`@`localhost`*/ /*!50003 TRIGGER `before_order_insert` BEFORE INSERT ON `order_table` FOR EACH ROW BEGIN
    SET NEW.date = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `prod_category`
--

DROP TABLE IF EXISTS `prod_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prod_category` (
  `category_id` tinyint NOT NULL,
  `product_id` tinyint NOT NULL,
  PRIMARY KEY (`category_id`,`product_id`),
  CONSTRAINT `category_prod_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_category`
--

LOCK TABLES `prod_category` WRITE;
/*!40000 ALTER TABLE `prod_category` DISABLE KEYS */;
INSERT INTO `prod_category` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `prod_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` tinyint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Coffee','avaliable','coffee_image.jpg',15),(2,'Tea','avaliable','tea_image.jpg',5),(3,'Juice','avaliable',NULL,5),(4,'Sandwich','unavaliable',NULL,6),(5,'Cake','unavaliable',NULL,7),(6,'Pizza','unavaliable',NULL,10),(7,'Burger','unavaliable',NULL,8);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `product_in_every_order`
--

DROP TABLE IF EXISTS `product_in_every_order`;
/*!50001 DROP VIEW IF EXISTS `product_in_every_order`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `product_in_every_order` AS SELECT 
 1 AS `order_id`,
 1 AS `date`,
 1 AS `name`,
 1 AS `quantity`,
 1 AS `total_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `room_id` tinyint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'2003'),(2,'2008');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` tinyint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `ext` varchar(4) DEFAULT NULL,
  `order_id` tinyint DEFAULT NULL,
  `room_id` tinyint DEFAULT NULL,
  `admin_id` tinyint DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_order` (`order_id`),
  KEY `fk_room` (`room_id`),
  KEY `fk_admin` (`admin_id`),
  CONSTRAINT `fk_admin` FOREIGN KEY (`admin_id`) REFERENCES `user` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_order` FOREIGN KEY (`order_id`) REFERENCES `order_table` (`order_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_room` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'John Doe','password123','john_image.jpg','1234',1,1,NULL),(2,'Jane Smith','securepassword456','jane_image.jpg','5678',1,2,1),(3,'Moahamed','password123','john_image.jpg','1234',1,1,NULL),(4,'Felopater','securepassword456','jane_image.jpg','5678',1,2,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `All_Products`
--

/*!50001 DROP VIEW IF EXISTS `All_Products`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mohamed`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `All_Products` AS select `product`.`name` AS `Product`,`product`.`price` AS `price`,`product`.`image` AS `image`,`product`.`action` AS `Action` from `product` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `All_Users`
--

/*!50001 DROP VIEW IF EXISTS `All_Users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mohamed`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `All_Users` AS select `user`.`name` AS `Name`,`room`.`name` AS `Room`,`user`.`image` AS `image`,`user`.`ext` AS `Ext` from (`user` join `room` on((`user`.`room_id` = `room`.`room_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Amount`
--

/*!50001 DROP VIEW IF EXISTS `Amount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mohamed`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Amount` AS select `order_table`.`order_id` AS `order_id`,`order_table`.`date` AS `date`,sum((`product`.`price` * `order_details`.`quantity`)) AS `total_price` from ((`order_details` join `product` on((`order_details`.`product_id` = `product`.`product_id`))) join `order_table` on((`order_details`.`order_id` = `order_table`.`order_id`))) group by `order_table`.`order_id`,`order_table`.`date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Orders`
--

/*!50001 DROP VIEW IF EXISTS `Orders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mohamed`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Orders` AS select `order_table`.`date` AS `Order_Date`,`user`.`name` AS `Name`,`room`.`name` AS `Room`,`user`.`ext` AS `Ext`,`order_table`.`action` AS `Action`,(`product`.`price` * `order_details`.`quantity`) AS `Total` from ((((`order_details` join `order_table` on((`order_table`.`order_id` = `order_details`.`order_id`))) join `user` on((`user`.`user_id` = `order_table`.`user_id`))) join `room` on((`room`.`room_id` = `user`.`room_id`))) join `product` on((`product`.`product_id` = `order_details`.`product_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Total_amount`
--

/*!50001 DROP VIEW IF EXISTS `Total_amount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mohamed`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Total_amount` AS select `user`.`name` AS `name`,`order_table`.`date` AS `date`,sum((`product`.`price` * `order_details`.`quantity`)) AS `total_price` from (((`order_details` join `product` on((`order_details`.`product_id` = `product`.`product_id`))) join `order_table` on((`order_details`.`order_id` = `order_table`.`order_id`))) join `user` on((`order_table`.`user_id` = `user`.`user_id`))) group by `user`.`user_id`,`order_table`.`date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `amount`
--

/*!50001 DROP VIEW IF EXISTS `amount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `amount` AS select sum((`product`.`price` * `order_details`.`quantity`)) AS `total_price` from (`product` join `order_details` on((`product`.`product_id` = `order_details`.`product_id`))) where ((`product`.`product_id` in (1,2)) and (`order_details`.`order_id` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `product_in_every_order`
--

/*!50001 DROP VIEW IF EXISTS `product_in_every_order`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mohamed`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `product_in_every_order` AS select `order_table`.`order_id` AS `order_id`,`order_table`.`date` AS `date`,`product`.`name` AS `name`,`order_details`.`quantity` AS `quantity`,(`product`.`price` * `order_details`.`quantity`) AS `total_price` from ((`order_details` join `product` on((`order_details`.`product_id` = `product`.`product_id`))) join `order_table` on((`order_details`.`order_id` = `order_table`.`order_id`))) order by `order_table`.`order_id`,`product`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-18 23:57:28
