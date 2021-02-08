CREATE DATABASE  IF NOT EXISTS `restaurant` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `restaurant`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: restaurant
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `chef`
--

DROP TABLE IF EXISTS `chef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chef` (
  `proficiency` int DEFAULT NULL,
  `cooking_style` varchar(12) DEFAULT NULL,
  `sid` int NOT NULL,
  PRIMARY KEY (`sid`),
  CONSTRAINT `chef_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `staff` (`sid`),
  CONSTRAINT `proficiency` CHECK (((`proficiency` >= 0) and (`proficiency` <= 5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chef`
--

LOCK TABLES `chef` WRITE;
/*!40000 ALTER TABLE `chef` DISABLE KEYS */;
INSERT INTO `chef` VALUES (2,'Cutting',13),(3,'Steaming',14),(4,'Braising',15),(4,'Braising',16),(3,'Stir-frying',17),(5,'Stir-frying',18);
/*!40000 ALTER TABLE `chef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contain`
--

DROP TABLE IF EXISTS `contain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contain` (
  `order_number` varchar(20) NOT NULL,
  `dish_name` varchar(50) NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`order_number`,`dish_name`),
  KEY `dish_name` (`dish_name`),
  CONSTRAINT `contain_ibfk_1` FOREIGN KEY (`order_number`) REFERENCES `orders` (`order_number`),
  CONSTRAINT `contain_ibfk_2` FOREIGN KEY (`dish_name`) REFERENCES `dish` (`dish_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contain`
--

LOCK TABLES `contain` WRITE;
/*!40000 ALTER TABLE `contain` DISABLE KEYS */;
INSERT INTO `contain` VALUES ('001','General Tsos Chicken',2),('001','Guoyou pork',1),('001','Tenderized Truffles & Yak',2),('002','Barbecued Mustard & Garlic Calzone',1),('002','beef pho',2),('002','boiled spicy fish',2),('003','Chestnut and Nutmeg Gingerbread',2),('003','Pressure-Fried Vegetables & Frog',1),('003','Tenderized Parmesan Lobster',1),('004','Simmered Mountain Rabbit',2),('004','Tenderized Truffles & Yak',1),('005','Guoyou pork',1),('005','Sweet and sour pork ribs',2),('005','Tenderized Truffles & Yak',2),('006','Barbecued Mustard & Garlic Calzone',1),('006','boiled spicy fish',1),('006','Cranberry Genoise',2),('007','Chestnut and Nutmeg Gingerbread',2),('007','Pressure-Fried Vegetables & Frog',1),('008','Breaded Cucumber & Lime Pizza',2),('008','Tenderized Truffles & Yak',1),('009','Simmered Mountain Rabbit',2),('010','Chestnut and Nutmeg Gingerbread',2),('010','Pressure-Fried Vegetables & Frog',1),('010','Sautéed Orange & Mustard Vegetables',1),('011','Tenderized Parmesan Lobster',1),('012','Fire-Roasted Basil & Mint Yak',1),('012','Rum and Praline Delight',1),('013','Breaded Cucumber & Lime Pizza',1),('013','Sautéed Dark Beer Pork',1),('014','Ginger Candy',1),('014','Tenderized Parmesan Lobster',1),('015','beef pho',1),('015','Tenderized Parmesan Lobster',1);
/*!40000 ALTER TABLE `contain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cooked_by`
--

DROP TABLE IF EXISTS `cooked_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cooked_by` (
  `dish_name` varchar(50) NOT NULL,
  `sid` int NOT NULL,
  PRIMARY KEY (`dish_name`,`sid`),
  KEY `sid` (`sid`),
  CONSTRAINT `cooked_by_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `chef` (`sid`),
  CONSTRAINT `cooked_by_ibfk_2` FOREIGN KEY (`dish_name`) REFERENCES `dish` (`dish_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cooked_by`
--

LOCK TABLES `cooked_by` WRITE;
/*!40000 ALTER TABLE `cooked_by` DISABLE KEYS */;
INSERT INTO `cooked_by` VALUES ('beef pho',13),('Pressure-Fried Vegetables & Frog',13),('Rum and Praline Delight',13),('Tenderized Truffles & Yak',13),('Chestnut and Nutmeg Gingerbread',14),('General Tsos Chicken',14),('Sautéed Dark Beer Pork',14),('Sautéed Orange & Mustard Vegetables',14),('Barbecued Mustard & Garlic Calzone',15),('Ginger Candy',15),('Tenderized Parmesan Lobster',15),('boiled spicy fish',16),('Cranberry Genoise',16),('Simmered Peas & Mushroom Oysters',16),('Breaded Cucumber & Lime Pizza',17),('Fire-Roasted Basil & Mint Yak',17),('Guoyou pork',17),('Roasted Almonds & Avocado Bread',18),('Simmered Mountain Rabbit',18),('Sweet and sour pork ribs',18);
/*!40000 ALTER TABLE `cooked_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `phone_number` varchar(15) NOT NULL,
  `canme` varchar(40) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('100-420-8127','Eugen Dicks','520 Mcguire Parkway'),('102-952-3372','Joelynn Brunker','594 Debs Park'),('103-503-2686','Caril Harron','94669 Westerfield Place'),('105-616-1693','Desirae Decaze','4471 Arizona Hill'),('106-734-8506','Templeton Wagon','0 Shelley Terrace'),('118-932-2810','Isidoro Edghinn','1 Declaration Crossing'),('119-665-9845','Michale Rebert','88 Buhler Terrace'),('122-375-9844','Shane Petty','4 Meadow Valley Street'),('123-855-4413','Nessa Meas','129 Manitowish Way'),('128-231-0509','Carmelina Frisdick','62 Oriole Park'),('131-378-1335','Tommie Lyddyard','9 Northwestern Junction'),('135-970-7883','Virgie Tither','0 Independence Avenue'),('137-117-1194','Ramsey Rainey','12327 John Wall Road'),('141-711-0172','Kurtis Chsteney','5 Knutson Center'),('142-361-2736','Llewellyn Bresnen','37622 Hansons Place'),('145-841-3835','Reta Dymock','6238 Colorado Street'),('154-811-9362','Deni Yaknov','2 Gulseth Way'),('155-213-1129','Patsy Krysztofowicz','01 Myrtle Park'),('164-101-6441','Burgess De Blasio','240 Barnett Junction'),('166-731-4271','Antony Adamski','27728 American Road'),('169-963-6990','Dinnie Sankey','3898 Buena Vista Hill'),('172-568-7497','Benjie Wines','27844 South Avenue'),('176-913-6644','Neala Swede','4 Sutteridge Street'),('177-368-9134','Charyl Winsbury','9 Bayside Crossing'),('179-115-9035','Kore Peerman','865 Spaight Place'),('179-402-0182','Noak Zienkiewicz','6 Nancy Junction'),('184-334-0856','Johan Dawidowsky','59 Mitchell Parkway'),('186-510-1663','Arte McGrady','47 Butternut Terrace'),('191-611-3069','Arabela Raunds','5077 Arkansas Point'),('194-703-6822','Kaleena Crummay','855 Sauthoff Pass'),('195-948-6463','Jillana Guppy','7958 Colorado Plaza'),('197-169-3152','Bartolemo Hadaway','751 Caliangt Place'),('197-586-9378','Fernanda Whyffen','2 Sherman Circle'),('197-601-1983','Dalila Heaney`','81908 Carey Terrace'),('199-306-7267','Deerdre Gaiter','4436 Hanover Crossing'),('199-348-9857','Hailey Henric','307 Northfield Drive'),('199-998-8480','Averil Punt','61839 Hazelcrest Way'),('201-436-7063','Harrie Effnert','83933 Spaight Hill'),('201-683-0581','Cymbre Welland','98 Oak Alley'),('201-878-0232','Burnard Mc Gorley','2819 Doe Crossing Parkway'),('205-284-4253','Yvor Mum','1 Debs Place'),('209-466-2326','Silas Merrien','4 Grayhawk Circle'),('210-656-6911','Amandy Chrispin','673 Golden Leaf Road'),('213-847-9825','Pooh Fanstone','522 Thompson Alley'),('214-643-6022','Jeddy Ackenson','55 Darwin Point'),('216-468-0271','Hadlee Dorrins','60539 Donald Parkway'),('221-884-7245','Babara Secombe','6 Sloan Hill'),('222-236-7174','Donella Jewess','1 Stephen Hill'),('225-591-4049','Bax Hotchkin','5 Wayridge Way'),('231-426-7143','Kippar Addionisio','5296 Petterle Street'),('231-819-7747','Marilyn Godard','241 Crescent Oaks Center'),('232-115-7707','Evangelia Maymond','5 Everett Alley'),('232-807-9691','Cyndia Hugli','5 Artisan Street'),('236-225-0499','Sarena Haccleton','537 Pennsylvania Point'),('237-134-8416','Jared Hasnip','7 Elgar Point'),('237-431-2785','Maurie Strutz','85 Di Loreto Circle'),('239-367-1885','Matti Prydden','4 Crowley Street'),('242-233-5875','Anabella Spurling','41 Ridgeview Terrace'),('243-360-8424','Daryn Climo','61700 Grover Center'),('249-610-1014','Ignatius Revington','5294 Kinsman Parkway'),('255-146-4796','Jocelyne Hedgeley','4 Harbort Center'),('256-983-2885','Barbee Pingston','22 Becker Trail'),('257-406-4307','Jarrett Dymond','189 Ruskin Trail'),('259-101-5474','Sile Ridoutt','76968 Sloan Circle'),('260-473-0254','Selma Lanney','9171 Northfield Center'),('264-229-6618','Shay See','19660 Pennsylvania Terrace'),('267-623-5978','Roman Brewett','83 Banding Terrace'),('267-636-9006','Emilie Kolis','9 Mariners Cove Lane'),('268-287-4784','Doe Babcock','121 Maywood Street'),('270-236-4491','Meryl Gatherell','83619 Mallard Lane'),('271-873-8687','Delmore Jonk','3 Kim Lane'),('275-257-8388','Dionisio Bohlmann','9 Canary Road'),('275-414-9582','Krissy Meads','027 Cardinal Pass'),('275-439-2669','Rose Stiling','326 Shasta Street'),('276-839-8694','Massimiliano Sex','83 Arkansas Lane'),('278-644-0430','Glen Webby','0019 South Terrace'),('278-853-5500','Clarance Minelli','2774 Namekagon Trail'),('279-623-2795','Theodor Shoebridge','2 Loeprich Road'),('280-277-9015','Benni Eleshenar','2 Hanover Road'),('282-230-1129','Rafaelia Flores','094 Huxley Junction'),('287-267-6184','Deni Vondrys','2 Sachtjen Street'),('289-271-9005','Quentin Leitche','43933 Arizona Place'),('289-909-6821','Vitoria Corfield','4 Golf View Court'),('295-648-1858','Logan Ondra','01176 Golf Course Terrace'),('299-131-9756','Eziechiele Ferrier','243 Dakota Place'),('299-830-5493','Netty Batchan','381 Green Terrace'),('300-394-9365','Maure Chyuerton','3 Banding Place'),('301-882-6295','Uta Gwillym','4 American Point'),('304-794-7881','Vittoria Warcup','5 Evergreen Place'),('308-655-8521','Abby Sillitoe','6550 Evergreen Point'),('311-589-9171','Gretna Guilbert','07578 Petterle Circle'),('323-611-3182','Layney Eaglen','3098 Packers Crossing'),('323-942-6243','Shaun Littlefair','1 Ludington Pass'),('325-208-6386','Aurora Wealleans','8 Ridgeview Crossing'),('326-790-2517','Ashton Robard','26468 Ohio Place'),('332-209-7419','Alfred Zwicker','0262 Basil Avenue'),('336-778-7617','Anabel Meegin','58 Oak Valley Avenue'),('337-796-8453','Astrix Alderwick','25 Crescent Oaks Point'),('340-569-5162','Yank Gurdon','7554 Holy Cross Alley'),('343-596-7894','Aldridge Heijnen','80 Tennessee Lane'),('344-135-1040','Valencia St. Quentin','457 Rigney Junction'),('344-410-1662','Merry Westmancoat','1 Ramsey Avenue'),('345-347-1685','Olly Dragge','5 Crownhardt Hill'),('347-436-0310','Irwinn Tumilty','46 Ridge Oak Junction'),('350-204-8636','Esteban Fryman','11444 Fuller Alley'),('350-645-9685','Bibi Russam','63567 Union Parkway'),('350-677-8550','Germaine Mollene','36 Towne Street'),('352-417-5592','Janeczka Phifer','197 Sunfield Avenue'),('352-802-8232','Shanta Giacomazzo','54725 Walton Parkway'),('353-462-7080','Clevey Klimpt','4 Eastlawn Terrace'),('354-288-9130','Arley Peniman','2 Dakota Road'),('354-978-9680','Andre Graalman','41971 Kedzie Terrace'),('356-897-3336','Thorsten Clemens','979 Sugar Court'),('358-245-3730','Natasha Rudolph','35910 Talisman Parkway'),('361-568-0550','Wade Mulliss','1 Spohn Junction'),('364-364-9783','Kalinda Fesby','62 4th Alley'),('364-377-6353','Douglas Littlefield','0713 Mariners Cove Terrace'),('368-484-0398','Wake Lavies','704 Arapahoe Plaza'),('368-613-3124','Arthur Wauchope','9 Doe Crossing Drive'),('369-754-3679','Joyan Neicho','39476 Nova Avenue'),('372-508-9402','Gordie Maymand','76551 Eastwood Avenue'),('374-245-9087','Raffarty Covely','4200 Kennedy Circle'),('376-588-0865','Theodore Bontine','7332 Lighthouse Bay Street'),('378-756-3940','Noellyn Gresty','4 David Avenue'),('383-558-9622','Johny Jencken','34 Commercial Avenue'),('384-102-4024','Mickie Duckerin','8 Cottonwood Parkway'),('384-412-9834','Kally Leeves','373 Swallow Plaza'),('385-252-5298','Dorri Krause','199 Hoard Alley'),('388-553-7870','Clevie La Rosa','53 Dixon Pass'),('390-136-6978','Jenica Coventon','0 5th Pass'),('390-424-3608','Sammie Ratnage','1 Laurel Pass'),('391-415-6884','Augustus Claiton','4 Lawn Street'),('396-829-8007','Channa Crowthe','63 Sachtjen Parkway'),('402-414-2447','Andie Rechert','012 Comanche Park'),('402-568-4514','Cassie Longfield','78077 Onsgard Pass'),('403-256-3287','Ferdinande Milborn','348 Fulton Lane'),('404-167-0827','Tiffani Jersh','17638 Dakota Drive'),('405-832-2833','Meier Muttock','67 Shoshone Lane'),('407-306-7660','Corie Klimecki','33 Veith Park'),('410-138-5827','Rab Levis','82 Judy Trail'),('410-865-9470','Godard Jantel','53116 Mendota Center'),('412-905-7548','Vallie Orneles','450 Goodland Drive'),('413-329-9571','Davidde M\'Quharg','23 Fremont Park'),('415-813-3034','Neddy Harbertson','59920 Browning Crossing'),('418-139-8720','Zia Truitt','6 Havey Crossing'),('419-740-1906','Edlin Docksey','27 Summer Ridge Terrace'),('419-894-9350','Emmet Spraggon','23203 Arrowood Park'),('421-360-9226','Essy Ledeker','08146 Holmberg Pass'),('421-659-9983','Torrie Patching','788 Meadow Vale Court'),('422-684-8040','Monti Craigg','24746 Warrior Avenue'),('423-777-6469','Otha Dedham','79 Towne Street'),('427-280-5822','Ivory Hassen','001 4th Terrace'),('430-726-7420','Gwyneth Knapper','45 Donald Crossing'),('433-849-5609','Gamaliel Shaves','59841 Forest Dale Road'),('434-733-9641','Bess Campaigne','06441 Lerdahl Pass'),('435-801-5775','Levon Fasset','1 Kipling Pass'),('436-906-3670','Sashenka Clapp','3 Oxford Parkway'),('436-927-0612','Robina Tarrier','9 Heath Crossing'),('439-249-3211','Harper Stigell','37 Burning Wood Junction'),('442-682-3413','Avie Samwyse','37935 Grover Park'),('443-537-1988','Betty Swiffen','3653 Loomis Drive'),('444-349-6115','Collie Andrysiak','39 School Avenue'),('444-955-0632','Luke Qusklay','15924 Leroy Place'),('448-148-7584','Kurtis Matokhnin','66 Ramsey Alley'),('452-695-0695','Vern Thomson','8342 Hoard Street'),('455-408-5931','Christopher Ashford','63121 Donald Terrace'),('458-664-6447','Mariette Kingswold','7775 Eastwood Alley'),('462-279-9401','Wolfie Careswell','35 Laurel Pass'),('463-276-0840','Richardo Blincko','27096 Bashford Plaza'),('465-259-4223','Ryun Elcott','3111 Manitowish Parkway'),('465-429-7186','Etta Sangwin','76441 Algoma Center'),('471-968-1731','Jillayne Castagne','4607 Manley Plaza'),('474-486-1298','Kippie Stetson','49430 Homewood Park'),('475-636-4898','Leoine Badsey','65969 Anniversary Lane'),('483-924-9284','Adara Arend','43550 4th Circle'),('491-250-2041','Christabel Hasely','96192 Oneill Road'),('494-613-8270','Sibylle Leipoldt','15494 Vidon Circle'),('494-978-4798','Merrily Sesser','45 Grover Park'),('496-910-3052','Ahmad Seiler','29340 Melody Avenue'),('498-409-3699','Merrili Craister','47 Nova Road'),('499-952-9251','Dur Jablonski','8 Drewry Trail'),('502-490-6138','Estrella Huzzay','714 Eastlawn Crossing'),('502-669-0076','Janeva Mounfield','96 Stephen Circle'),('503-706-2628','Prinz Larvent','2041 Morning Crossing'),('506-147-8564','Carmita Joesbury','41030 Eliot Circle'),('506-260-7270','Marjorie Roll','1574 Bay Road'),('507-947-3304','Lennard Shellum','42 Milwaukee Circle'),('511-479-0333','Emilee Zannelli','2 Hanson Circle'),('513-591-6916','Gustie MacTrustrie','94 Jackson Street'),('514-123-8900','Nimrah Carter','190  Lynden Road'),('514-133-1567','Jevan Hope','3020  rue Parc'),('514-140-1264','Nettie Cline','2318  Royal Avenue'),('514-141-5854','Armaan Gibbons','3569  Lockhart Drive'),('514-202-1544','Ava Pollard','1120  th Avenue'),('514-273-3594','Rong Huang','3242  Boulevard Cremazie'),('514-303-2334','Teegan Liu','3417  Brew Creek Rd'),('514-404-2154','Jing Guo','283  Jasper Avenue'),('514-421-1768','Tiana House','1528  Halsey Avenue'),('518-364-1743','Crin Kilrow','2 Declaration Trail'),('521-490-7833','Tallie Torri','82517 Calypso Parkway'),('522-970-9074','Tabina Eskrick','84 Golden Leaf Way'),('526-133-0867','Guthrie Quig','915 Hoepker Crossing'),('527-254-9649','Jerrie Hansed','3 Merry Junction'),('529-318-1527','Quent Seggie','5 Hoard Alley'),('530-870-7535','Cointon Lambkin','0 Mendota Point'),('532-503-9879','Norris Macek','4 Elgar Parkway'),('535-393-4470','Frannie Eggar','7404 Waubesa Drive'),('542-703-3597','Marilee Gonzalez','8 Jana Street'),('542-786-1476','Harcourt Attwool','63 Truax Street'),('544-347-9134','Mariam Rylatt','8666 Scoville Park'),('546-123-3344','Amelita Waslin','8 Haas Circle'),('547-456-9557','Lyndsay Macourek','06 Sycamore Avenue'),('548-862-0127','Silvie Phizaclea','7 West Plaza'),('549-456-6214','Anjela Nealey','72471 Shasta Parkway'),('550-576-1935','Woody Osselton','4626 Southridge Drive'),('550-882-2259','Jecho Saice','9 Norway Maple Hill'),('552-112-5986','Annnora Horrigan','18 Orin Plaza'),('568-346-7806','Jemie Groocock','405 Colorado Terrace'),('568-502-7102','Philippine Toyer','2902 Cordelia Alley'),('578-406-8583','Ricoriki Waby','29 Jackson Place'),('579-879-8219','Reinald Skerm','05 Main Road'),('580-957-3869','Charley Bodd','29070 Nancy Court'),('581-546-0855','Danika Cuseick','049 Saint Paul Trail'),('583-815-5143','Aldus Cull','3 Clarendon Place'),('594-717-2455','Florinda Bilston','858 Burning Wood Road'),('596-686-3254','Lanita Laux','209 Messerschmidt Center'),('598-838-8001','Webster Betteney','95 Harper Road'),('599-747-6894','Persis Connell','9 Express Hill'),('600-673-2559','Janella Slowly','1595 Carioca Road'),('602-493-1614','Morris Shorton','0 Eggendart Court'),('608-370-7596','Brigitte Spere','4680 Messerschmidt Drive'),('610-664-3653','Dana Lorkins','9 Hoepker Parkway'),('614-882-5227','Caril Cherrington','2 Ramsey Road'),('620-319-2433','Jayme Weavers','6 Hallows Drive'),('622-911-1567','Andreas Achromov','24 Jackson Parkway'),('630-195-1243','Artus Akehurst','636 Mcbride Place'),('631-665-4403','Salli Waddy','6563 Melody Drive'),('632-578-4483','Israel Lantaff','41058 Fallview Drive'),('633-128-6276','Katti Brevetor','8778 Ohio Crossing'),('634-399-6767','Delmor Olczak','849 Sundown Pass'),('642-540-0806','Petunia Longden','68657 Miller Center'),('644-171-3229','Mitchell Cradoc','89 Nelson Alley'),('646-847-7241','Devon Croxley','0 Pierstorff Parkway'),('652-376-5080','Michaelina Cammomile','211 Talmadge Way'),('655-810-1583','Trudey Izkovici','5444 Coleman Drive'),('658-544-2100','Lilias Heffron','64 Farmco Pass'),('660-947-0982','Bernardo Kemmey','02 Lighthouse Bay Junction'),('662-352-0109','Demetrius Grindell','0 Arapahoe Drive'),('663-405-0686','Hilda Kindley','7 Nobel Terrace'),('664-209-9747','Sheba Belly','995 Main Park'),('669-686-5396','Darcy Newby','36 Kinsman Plaza'),('672-654-7970','Alis Heinz','1 Fisk Point'),('677-953-7724','Dall Hounson','964 Springs Parkway'),('678-192-1913','Goldarina Wetherick','95 Maryland Parkway'),('681-945-7207','Ardyce Waddilow','9 Amoth Parkway'),('684-236-8349','Elbertina Dilleston','211 Crescent Oaks Street'),('693-695-0172','William Sipson','00 Straubel Parkway'),('694-429-7281','Dewain Dautry','32 Rutledge Alley'),('695-214-1592','Amie Pallis','3396 Hooker Center'),('696-561-5473','Rickie Wincom','39465 Arapahoe Lane'),('696-670-5670','Dosi Lesslie','5306 Thierer Court'),('699-823-4297','Dame Ginman','7736 Bartillon Pass'),('701-120-3298','Ernestus Hyslop','35 Parkside Street'),('704-912-0171','Olenka Mellonby','6570 Dawn Terrace'),('705-202-9377','Augusto Winmill','1228 Columbus Pass'),('705-386-3527','Mallorie Felgat','96694 Anhalt Plaza'),('708-796-3656','Carny Wasbey','14525 Eggendart Terrace'),('709-127-0368','Nolan O\' Ronan','34 Redwing Parkway'),('709-928-1209','Ruben Shakesby','6130 Evergreen Point'),('712-346-2534','Alys Jezard','87972 Badeau Road'),('715-327-6063','Jaclin Ibbotson','36 Carberry Crossing'),('715-447-7155','Florry McKellen','8 Fairfield Street'),('718-225-0289','Huntlee Ciepluch','6117 Prentice Point'),('720-163-0032','Lula Trippack','57856 Meadow Vale Circle'),('720-652-2680','Devonna Limeburn','6677 Bluejay Crossing'),('724-338-5100','Valera Dingley','072 Nelson Way'),('728-626-6141','Cordell Remmer','0651 Columbus Road'),('729-623-3170','Iggy Hamflett','0 Trailsway Terrace'),('730-445-8610','Evita Colnett','83 Sycamore Parkway'),('730-633-4265','Holly-anne Breukelman','8 Dexter Trail'),('730-659-8361','Kellie Foan','59 Colorado Road'),('731-242-9144','Keene Shiril','7 Starling Parkway'),('732-273-5206','Shena Taleworth','739 Ludington Terrace'),('734-644-4472','Cristiano Twell','2 Boyd Place'),('736-723-3459','Alisander Ellingford','3 Ridgeview Junction'),('736-876-7719','Lucienne Buckell','42013 Melody Drive'),('736-907-0581','Flory Dudding','61 1st Crossing'),('740-634-1206','Omar Yanele','534 Hallows Crossing'),('742-489-0749','Andras Tutin','609 Melby Terrace'),('743-617-7993','Sheila Dametti','8 Clemons Way'),('745-925-1822','Alf Elgy','4 Marcy Road'),('746-568-8326','Andra Ponter','7 Schiller Trail'),('747-206-3894','Egon Gunton','1 Mcbride Crossing'),('747-671-2067','Kylynn Birnie','8990 Mccormick Way'),('748-990-6599','Johnathan Tows','28233 School Circle'),('751-413-0965','Fidela Agnolo','536 Darwin Way'),('755-367-5914','Marti Blackman','1679 Tony Road'),('760-844-7762','Melisenda Baddeley','68263 Victoria Street'),('760-943-6742','Nara Zoellner','3 Longview Court'),('761-997-8932','Etti Rossin','7 Ludington Crossing'),('767-154-0814','Alice Booler','65 Spenser Junction'),('768-365-8565','Vinnie Drage','8 Thackeray Alley'),('773-543-0966','Jen Whiff','912 Butterfield Way'),('776-382-9684','Tracie Warrell','061 Sutherland Road'),('779-215-4279','Stace Willcock','6 Warbler Plaza'),('785-848-4622','Marcelo Quarless','6 Forest Run Way'),('787-843-7276','Erhart Gell','19 Towne Pass'),('788-304-4304','Mellie Frankling','9 Talisman Plaza'),('788-686-2394','Torie McTeague','951 Pepper Wood Circle'),('789-466-8148','Duffie Sarvar','5319 Kinsman Street'),('793-542-8629','Brandon McMahon','084 Westport Trail'),('794-286-5811','Jephthah McGrowther','20180 Corry Court'),('795-460-2105','Estell Gatteridge','54 Mcguire Street'),('796-314-0886','Reggie Backe','37 Fair Oaks Point'),('798-441-6508','Didi Perillio','82 Goodland Road'),('799-622-2214','Maxie Domanski','470 Fisk Point'),('799-702-1522','Zeke Georgiev','9 Novick Point'),('800-537-7528','Bernadene Bulfoy','16 Lawn Park'),('800-843-1052','Alissa Brason','819 Miller Avenue'),('800-845-6832','Shandy Sunter','53915 Manley Avenue'),('801-214-7040','Darcy Ilden','3530 Glendale Alley'),('801-698-5079','Isabelle Geram','9761 Commercial Park'),('805-278-7100','Jeniffer Joysey','27214 Hanson Circle'),('808-461-1121','Nikos Leeves','980 Rieder Pass'),('808-586-9644','Carly Mollin','3 Schiller Center'),('812-670-4129','Beverley Lalevee','42110 Nova Park'),('813-341-5263','Shadow Churm','88 Ohio Center'),('814-415-4811','Nicolle Heinle','444 Marquette Park'),('814-840-4329','Delcina Stoven','7829 Cambridge Hill'),('815-861-8806','Wit Duchant','69388 Lindbergh Terrace'),('816-299-1189','Erastus MacAless','22115 Fallview Junction'),('817-658-9237','Rockwell Ginty','5143 Oakridge Junction'),('820-213-5892','Tabor Dowty','5 Caliangt Park'),('820-889-6538','Valentina Norley','4427 Sycamore Pass'),('821-962-2973','Madelin Pear','7 Clyde Gallagher Road'),('826-449-5976','Daveta Twinterman','45 Union Junction'),('829-904-0768','Izaak Fleischmann','9 Homewood Place'),('832-985-5062','Alaric Bartlomiejczyk','2 Rusk Court'),('834-202-5405','Duncan Melton','6 Debra Drive'),('834-499-3772','Giffie Pollak','505 Killdeer Point'),('835-624-5501','Bettye Lumm','5 Walton Court'),('835-685-5399','Kristine Sellar','6329 Elgar Street'),('837-835-1744','Wendeline Barwood','7 Moland Pass'),('838-561-9910','Alexis Kenset','3 Green Circle'),('838-951-7436','Pierce Southey','20409 Manufacturers Point'),('840-302-3422','Camilla Mattschas','246 Arapahoe Trail'),('841-245-8180','Clary Wychard','54 Melody Avenue'),('843-373-1751','Dolorita John','419 Mockingbird Court'),('845-264-7412','Cheston Graddon','2 Loomis Lane'),('849-740-6504','Kipp Saddleton','7 Heath Way'),('854-255-1743','Franny Sussams','6 Commercial Junction'),('857-227-7356','Leda Stopford','16125 Doe Crossing Avenue'),('857-509-1247','Raeann Dingivan','18 8th Court'),('859-134-7130','Edie Titley','2853 Florence Junction'),('859-281-8574','Ileana Sweatland','17062 Russell Trail'),('863-746-2968','Shae Spykings','2 Schurz Center'),('868-974-3346','Shina Suttaby','3477 Alpine Street'),('878-171-2888','Katlin Marsh','807 Village Drive'),('880-246-6672','Cynthy Massei','6 Forest Run Circle'),('887-893-8989','Valery Fredson','62 Grim Way'),('888-187-5862','Lucinda Cullinan','943 Moland Circle'),('891-112-2930','Caye Nisot','696 Forest Parkway'),('891-795-5207','Crissie Fane','268 Ohio Alley'),('899-148-2037','Morna Blackaller','81252 Gina Lane'),('899-668-0738','Alisun Blinckhorne','36 Cody Parkway'),('900-588-6397','Amye Keppin','62030 Esch Way'),('903-944-8262','Anatola Nice','81740 Truax Pass'),('905-602-1236','Charleen Dormand','077 Oak Valley Park'),('907-536-8737','Garrott Laden','108 North Parkway'),('908-422-2442','Selene Crookall','323 Lien Court'),('910-377-3838','Pier Posen','721 Maywood Road'),('911-996-2418','Estrellita Dumbrill','44865 Declaration Way'),('912-668-6873','Bradford Von Hindenburg','82301 Caliangt Court'),('918-539-2342','Urson Gayle','9 Summerview Center'),('918-846-6536','Gisella Chardin','472 Armistice Pass'),('921-591-6416','Sadella Aldie','071 Crowley Pass'),('922-257-7728','Willyt MacClenan','99 Northwestern Hill'),('923-283-1179','Joshia Miche','5676 Summit Pass'),('928-432-9971','Darcee Ohanessian','17 Lunder Pass'),('928-696-3858','Jud Landeg','5891 Emmet Hill'),('929-192-0423','Tadeo Caldero','23528 Bay Park'),('929-754-2921','Eberhard Sibery','70503 Bashford Lane'),('933-690-5285','Theresina Merrgen','6624 Birchwood Alley'),('936-159-7880','Armin Annetts','2651 Meadow Valley Trail'),('940-859-2676','Brendan Bull','7 Coleman Trail'),('942-692-0037','Addison Hefferan','72 1st Hill'),('946-716-9253','Marga MacMichael','90 Mcbride Circle'),('948-119-2798','Gawen Beggio','5573 Fisk Lane'),('950-407-7821','Wendie Brunke','00108 Di Loreto Drive'),('951-501-3492','Ebba Ironside','5 Morrow Hill'),('952-832-9977','Justine Gerant','7 Lighthouse Bay Road'),('958-925-1015','Dody Bowcock','38 Hanover Lane'),('959-882-3468','Ranee Fincke','8 Mayer Street'),('962-314-0906','Oswald Chelsom','4 Hallows Park'),('964-894-0725','Delora McAsgill','21 Stuart Hill'),('966-142-9947','Conway MacLise','20 Troy Avenue'),('968-933-1174','Augie Plummer','73 Quincy Way'),('971-189-7142','Blaire Laydel','1 Waxwing Alley'),('971-552-4822','Jilli Gibbieson','7730 Huxley Park'),('972-783-5307','Halli Scocroft','2 Lillian Center'),('977-727-8154','Iosep Storrs','0 Mitchell Parkway'),('981-784-6844','Gustavus Cana','1 Scott Terrace'),('985-819-0080','Cary Hearnah','584 Fair Oaks Center'),('994-817-0456','Hillard Aitcheson','63437 Melrose Road'),('997-597-7236','Thatcher Trevaskiss','614 7th Drive'),('998-914-1236','Appolonia Jiracek','116 Canary Avenue'),('998-964-6665','Stephi Verbeke','5 Oak Valley Circle'),('999-287-2872','Birch Legrand','9372 Leroy Lane'),('999-290-6365','Patricio Ruste','7447 Bartelt Street');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_guy`
--

DROP TABLE IF EXISTS `delivery_guy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_guy` (
  `delivery_method` varchar(12) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `sid` int NOT NULL,
  PRIMARY KEY (`sid`),
  CONSTRAINT `delivery_guy_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `staff` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_guy`
--

LOCK TABLES `delivery_guy` WRITE;
/*!40000 ALTER TABLE `delivery_guy` DISABLE KEYS */;
INSERT INTO `delivery_guy` VALUES ('Car','514-999-9999',7),('Bike','514-888-8888',8),('On foot','514-777-7777',9),('Car','514-666-6666',10),('Bike','514-555-5555',11),('On foot','514-444-4444',12);
/*!40000 ALTER TABLE `delivery_guy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_orders`
--

DROP TABLE IF EXISTS `delivery_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_orders` (
  `order_number` varchar(30) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `sid` int NOT NULL,
  `pname` varchar(30) DEFAULT NULL,
  `delivery_fee` double DEFAULT NULL,
  PRIMARY KEY (`order_number`),
  KEY `sid` (`sid`),
  KEY `pname` (`pname`),
  CONSTRAINT `delivery_orders_ibfk_1` FOREIGN KEY (`order_number`) REFERENCES `orders` (`order_number`),
  CONSTRAINT `delivery_orders_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `staff` (`sid`),
  CONSTRAINT `delivery_orders_ibfk_3` FOREIGN KEY (`pname`) REFERENCES `platform` (`pname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_orders`
--

LOCK TABLES `delivery_orders` WRITE;
/*!40000 ALTER TABLE `delivery_orders` DISABLE KEYS */;
INSERT INTO `delivery_orders` VALUES ('006','514-202-1544',7,'Uber Eats',5),('007','514-303-2334',9,'Chowbus',3),('008','514-404-2154',10,'Grubhub',2.5),('009','514-273-3594',9,'DoorDash',2.7),('014','514-273-3594',10,'DoorDash',2.7),('015','514-303-2334',8,'Grubhub',2.5);
/*!40000 ALTER TABLE `delivery_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dine_in_orders`
--

DROP TABLE IF EXISTS `dine_in_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dine_in_orders` (
  `order_number` varchar(30) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  PRIMARY KEY (`order_number`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `dine_in_orders_ibfk_1` FOREIGN KEY (`order_number`) REFERENCES `orders` (`order_number`),
  CONSTRAINT `dine_in_orders_ibfk_2` FOREIGN KEY (`phone_number`) REFERENCES `customer` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dine_in_orders`
--

LOCK TABLES `dine_in_orders` WRITE;
/*!40000 ALTER TABLE `dine_in_orders` DISABLE KEYS */;
INSERT INTO `dine_in_orders` VALUES ('001','514-123-8900'),('010','514-123-8900'),('004','514-133-1567'),('005','514-140-1264'),('003','514-141-5854'),('012','514-273-3594'),('013','514-273-3594'),('011','514-404-2154'),('002','514-421-1768');
/*!40000 ALTER TABLE `dine_in_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish`
--

DROP TABLE IF EXISTS `dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish` (
  `dish_name` varchar(50) NOT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`dish_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES ('Barbecued Mustard & Garlic Calzone',25),('beef pho',10.5),('boiled spicy fish',30.99),('Breaded Cucumber & Lime Pizza',19.9),('Chestnut and Nutmeg Gingerbread',25.9),('Cranberry Genoise',27),('Fire-Roasted Basil & Mint Yak',32.3),('General Tsos Chicken',15.5),('Ginger Candy',5.99),('Guoyou pork',17.99),('Pressure-Fried Vegetables & Frog',31.5),('Roasted Almonds & Avocado Bread',28.9),('Rum and Praline Delight',17.9),('Sautéed Dark Beer Pork',28.9),('Sautéed Orange & Mustard Vegetables',26.9),('Simmered Mountain Rabbit',22.5),('Simmered Peas & Mushroom Oysters',66.6),('Sweet and sour pork ribs',14.5),('Tenderized Parmesan Lobster',99.9),('Tenderized Truffles & Yak',50.99);
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_number` varchar(30) NOT NULL,
  `tips` double DEFAULT NULL,
  PRIMARY KEY (`order_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('001',2.1),('002',1.5),('003',1.2),('004',3),('005',2.3),('006',4),('007',3.7),('008',2.1),('009',2.4),('010',3.5),('011',4.1),('012',1.7),('013',2.3),('014',2.4),('015',5.5);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platform`
--

DROP TABLE IF EXISTS `platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform` (
  `pname` varchar(30) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`pname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform`
--

LOCK TABLES `platform` WRITE;
/*!40000 ALTER TABLE `platform` DISABLE KEYS */;
INSERT INTO `platform` VALUES ('Chowbus','https://www.chowbus.com/'),('DoorDash','https://www.doorDash.com/'),('Grubhub','https://www.grubhub.com/'),('Lyft','https://www.lyft.com/'),('Uber Eats','https://www.ubereats.com/en-US');
/*!40000 ALTER TABLE `platform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `rdate` date NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `timeslot` time DEFAULT NULL,
  PRIMARY KEY (`rdate`,`phone_number`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `customer` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES ('2020-01-15','514-202-1544','18:20:00'),('2020-01-21','514-141-5854','17:25:00'),('2020-01-22','514-133-1567','16:45:00'),('2020-01-22','514-404-2154','12:30:00'),('2020-01-23','514-140-1264','16:10:00'),('2020-01-23','514-273-3594','11:45:00'),('2020-01-25','514-421-1768','12:20:00'),('2020-01-29','514-123-8900','19:30:00'),('2020-01-30','514-421-1768','16:30:00'),('2020-02-19','514-303-2334','18:10:00');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `served_by`
--

DROP TABLE IF EXISTS `served_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `served_by` (
  `order_number` varchar(20) NOT NULL,
  `sid` int NOT NULL,
  PRIMARY KEY (`order_number`,`sid`),
  KEY `sid` (`sid`),
  CONSTRAINT `served_by_ibfk_1` FOREIGN KEY (`order_number`) REFERENCES `orders` (`order_number`),
  CONSTRAINT `served_by_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `staff` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `served_by`
--

LOCK TABLES `served_by` WRITE;
/*!40000 ALTER TABLE `served_by` DISABLE KEYS */;
INSERT INTO `served_by` VALUES ('001',1),('002',2),('003',3),('004',4),('005',5),('006',6);
/*!40000 ALTER TABLE `served_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `sid` int NOT NULL,
  `sname` varchar(40) DEFAULT NULL,
  `working_schdule` varchar(12) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  PRIMARY KEY (`sid`),
  CONSTRAINT `working_schdule` CHECK ((`working_schdule` in (_utf8mb4'morning',_utf8mb4'afternoon',_utf8mb4'evening')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Samuel Randall','morning',12),(2,'Shala Tang','morning',12),(3,'Macie Finely','afternoon',12),(4,'Jeffrey Frye','afternoon',12),(5,'Anna Black','evening',12),(6,'Hugo Turner','evening',12),(7,'Annie Carr','morning',13),(8,'Cara Allenr','morning',13),(9,'Jodie Stuart','afternoon',13),(10,'Cassie Noble','afternoon',13),(11,'Lachlan Lawrence','evening',13),(12,'Ammie Summers','evening',13),(13,'Lacie Barr','morning',15),(14,'Isla Greer','morning',15),(15,'Meadow Moran','afternoon',15),(16,'Meadow Mawwan','afternoon',15),(17,'Luis Nash','evening',15),(18,'Melanie Hill','evening',15);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waiter`
--

DROP TABLE IF EXISTS `waiter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waiter` (
  `sid` int NOT NULL,
  PRIMARY KEY (`sid`),
  CONSTRAINT `waiter_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `staff` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waiter`
--

LOCK TABLES `waiter` WRITE;
/*!40000 ALTER TABLE `waiter` DISABLE KEYS */;
INSERT INTO `waiter` VALUES (1),(2),(3),(4),(5),(6);
/*!40000 ALTER TABLE `waiter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'restaurant'
--

--
-- Dumping routines for database 'restaurant'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-10 20:18:16
