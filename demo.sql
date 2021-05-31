-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 31, 2021 at 09:24 AM
-- Server version: 8.0.24
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_product` (IN `productCode` INT, IN `productName` VARCHAR(50), IN `productPrice` INT, IN `productAmount` INT, IN `productDescription` TEXT, IN `productStatus` VARCHAR(50))  BEGIN
    INSERT INTO products(
        productCode,
        productName,
        productPrice,
        productAmount,
        productDescription,
        productStatus
    )
VALUES(
    productCode,
    productName,
    productPrice,
    productAmount,
    productDescription,
    productStatus
);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAll` ()  BEGIN
SELECT * FROM products ;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `Id` int NOT NULL,
  `productCode` int DEFAULT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `productPrice` int DEFAULT NULL,
  `productAmount` int DEFAULT NULL,
  `productDescription` text,
  `productStatus` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`Id`, `productCode`, `productName`, `productPrice`, `productAmount`, `productDescription`, `productStatus`) VALUES
(1, 111, 'mustang', 499999, 10, 'A', 'shipped'),
(3, 112, 'innova', 100000, 5, 'C', 'unship'),
(4, 113, 'mazda3', 200000, 2, 'C', 'shipped'),
(5, 114, 'morning i10', 50000, 10, 'C', 'shipped'),
(6, 115, 'Vinfast LUX A2.0', 250000, 10, 'B', 'shipped'),
(7, 116, 'Vinfast LUX SA 2.0', 300000, 4, 'A', 'shipped');

-- --------------------------------------------------------

--
-- Stand-in structure for view `products_view`
-- (See below for the actual view)
--
CREATE TABLE `products_view` (
`productCode` int
,`productName` varchar(50)
,`productPrice` int
,`productStatus` varchar(50)
);

-- --------------------------------------------------------

--
-- Structure for view `products_view`
--
DROP TABLE IF EXISTS `products_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `products_view`  AS SELECT `products`.`productCode` AS `productCode`, `products`.`productName` AS `productName`, `products`.`productPrice` AS `productPrice`, `products`.`productStatus` AS `productStatus` FROM `products` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `productCode` (`productCode`),
  ADD KEY `idx_products` (`productName`,`productPrice`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
