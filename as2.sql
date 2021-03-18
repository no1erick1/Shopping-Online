-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2020 at 09:23 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `as2`
--
CREATE DATABASE IF NOT EXISTS `as2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `as2`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `image` text DEFAULT 'img/no_image.jpg',
  `create_date` date NOT NULL DEFAULT current_timestamp(),
  `modify_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `image`, `create_date`, `modify_date`) VALUES
(14, 'Laptop', 'img/category/laptops.jpg', '2020-08-21', '2020-08-21'),
(15, 'Television', 'img/category/tivi-lg-43lk5400pta.jpg', '2020-08-21', '2020-08-21'),
(16, 'Weapon', 'img/category/3000.jpeg', '2020-08-21', '2020-08-21');

-- --------------------------------------------------------

--
-- Table structure for table `cus_order`
--

CREATE TABLE `cus_order` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `status` int(1) NOT NULL DEFAULT 0,
  `total` bigint(20) NOT NULL DEFAULT 0,
  `subtotal` bigint(20) NOT NULL DEFAULT 0,
  `shipping` bigint(20) NOT NULL DEFAULT 30000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cus_order`
--

INSERT INTO `cus_order` (`id`, `user_id`, `date`, `status`, `total`, `subtotal`, `shipping`) VALUES
(16, '1aed7ae1b16a7ad96d7972c86815547f', '2020-08-22 00:19:47', 1, 9980000, 9950000, 30000),
(17, '1aed7ae1b16a7ad96d7972c86815547f', '2020-08-22 00:27:12', 2, 12000000, 11970000, 30000),
(18, '1aed7ae1b16a7ad96d7972c86815547f', '2020-08-22 00:33:44', 2, 6000000, 5970000, 30000),
(19, '1aed7ae1b16a7ad96d7972c86815547f', '2020-08-22 00:34:24', 1, 9980000, 9950000, 30000),
(21, 'f7f6b83e8f1ed4b1081c31ecab0d0ae5', '2020-08-22 11:10:51', 2, 6000000, 5970000, 30000),
(22, 'f7f6b83e8f1ed4b1081c31ecab0d0ae5', '2020-08-23 16:17:45', 2, 18030000, 18000000, 30000),
(23, 'f7f6b83e8f1ed4b1081c31ecab0d0ae5', '2020-08-23 16:25:13', 1, 75990000, 75960000, 30000),
(24, 'f7f6b83e8f1ed4b1081c31ecab0d0ae5', '2020-08-23 16:28:41', 1, 84030000, 84000000, 30000),
(25, 'f7f6b83e8f1ed4b1081c31ecab0d0ae5', '2020-08-23 16:34:07', 1, 450030000, 450000000, 30000),
(26, 'f7f6b83e8f1ed4b1081c31ecab0d0ae5', '2020-08-23 16:34:29', 2, 450030000, 450000000, 30000),
(27, 'f7f6b83e8f1ed4b1081c31ecab0d0ae5', '2020-08-23 17:09:07', 0, 4530000, 4500000, 30000);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `pro_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `subtotal` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`pro_id`, `order_id`, `quantity`, `subtotal`) VALUES
(11, 16, 5, 9950000),
(11, 18, 3, 5970000),
(11, 19, 5, 9950000),
(11, 21, 3, 5970000),
(13, 17, 3, 11970000),
(14, 22, 4, 18000000),
(14, 25, 100, 450000000),
(14, 26, 100, 450000000),
(14, 27, 1, 4500000),
(15, 23, 4, 75960000),
(16, 24, 3, 84000000);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `price` bigint(20) NOT NULL DEFAULT 0,
  `description` mediumtext NOT NULL DEFAULT '',
  `quantity` bigint(20) NOT NULL DEFAULT 0,
  `discount` int(11) NOT NULL DEFAULT 0,
  `image` text DEFAULT 'img/no_image.jpg',
  `cat_id` int(11) NOT NULL,
  `create_date` date NOT NULL DEFAULT current_timestamp(),
  `pro_sold` bigint(20) NOT NULL DEFAULT 0,
  `name` text NOT NULL,
  `modify_date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `price`, `description`, `quantity`, `discount`, `image`, `cat_id`, `create_date`, `pro_sold`, `name`, `modify_date`, `status`) VALUES
(11, 1990000, 'Intel 10th Gen Dual Core i3-1005G1 Processor (1.2GHz, up to 3.4GHz, 4MB cache, 2 cores). 8GB DDR4 SDRAM, 128GB Solid State Drive, 1TB HDD, Intel UHD Graphics.  15.6 inch Touchscreen HD (1366 x 768) Display. Intel 802.11 ac Wi-Fi + Bluetooth 4.1, Webcam, HDMI, RJ-45.', 80, 0, 'img/product/51B4zvRbRBL._AC_SL1000_.jpg', 14, '2020-08-20', 20, '2020 Dell Inspiron 3000 15.6-inch HD Touchscreen Laptop PC, Intel 10th Gen Dual Core i3-1005G1 Processor, 8GB DDR4, 128GB SSD, 1TB HDD, Bluetooth, Windows 10, Black', '2020-08-22 11:26:35', 1),
(12, 2890000, '14. 0 inch FHD (1920 x 1080) TrueLife LED Backlight Touch IPS Display with EMR Pen Support\r\n8th generation Intel Core i3-8130U processor 2. 2 gigahertz\r\n4GB system memory for basic multitasking; 128GB eMMC flash memory\r\n360° flip-and-fold design; Intel UHD Graphics 620; Bluetooth 4. 0; HDMI output; USB Port, Backlit keyboard; Built-in webcam; Next-generation Intel WiFi 5 Wireless-AC connectivity (2x2, 867 Mbps)\r\nGoogle Chrome OS; Does not include a built-in DVD/CD drive; Stylus pen not included; Color: Urban Gray microphone-in/headphone-out combo jack.\r\nMemory Storage Capacity: 4. 0\r\nSystem Ram Type: ddr2_sdram', 100, 0, 'img/product/612s8qzleaL._AC_SL1000_.jpg', 14, '2020-08-20', 0, 'Dell Inspiron 2-in-1 14\" Full HD Touch-Screen Chromebook - Intel Core i3, 4GB Memory, 128GB eMMC Solid State Drive Urban Gray Chrome OS', '2020-08-21 00:00:00', 1),
(13, 3990000, 'HD Quality: The 720p high-definition screen offers an immersive picture and viewing experience at 1366 x 768 resolution. With dynamic brightness, this 19 Inch screen delivers a life-like picture.', 1324, 21, 'img/product/41oZ+zRqpwL._AC_.jpg', 15, '2020-08-20', 0, 'Furrion 19\" LED HD TV with 60Hz Refresh Rate, Stereo Sound, Climatesmart & VibrationSmart Technology - FEHS19S0A', '2020-08-21 00:00:00', 1),
(14, 4500000, 'Crystal processor 4K: This ultra-fast processor transforms everything you watch into stunning 4K.\r\nMulti voice: Smart TV with Alexa and Bixby.', 0, 0, 'img/product/71RiQZ0J2SL._AC_SL1000_.jpg', 15, '2020-08-20', 100, 'SAMSUNG 43-inch Class Crystal UHD TU-8000 Series - 4K UHD HDR Smart TV with Alexa Built-in (UN43TU8000FXZA, 2020 Model)', '2020-08-23 17:29:29', 1),
(15, 18990000, 'The Hatsan Blitz PCP Full Auto Air Rifle features select fire action; semi auto or full-auto fire. the barrel is 23\" long, fully shrouded, precision rifled, and choked. Includes advanced polymer construction, pistol grip, elevation adjustable comb, adjustable butt pad, and three fore stock accessory rails', 1996, 0, 'img/product/PY-5193_Hatsan-Blitz-Full-Auto_1583355026.jpg', 16, '2020-08-20', 4, 'Hatsan Blitz PCP Full Auto Air Rifle', '2020-08-21 15:14:37', 1),
(16, 28000000, 'The Gamo Swarm Maxxim G2 Air Rifle with Scope will allow you to shoot with confidence and reload at the ready. The G2 significantly enhances the hunt with extra magazine storage built right into the grip. This ten-shot, auto-oading break barrel air rifle includes the patent-pending 10X GEN 2 Technology with our revolutionary new horizontal inertia fed magazine integration, making it lighter, more compact and low profile. This upgraded rapid-reload technology avoids double loading a pellet—\r\n\r\nthe magazine rotates and inserts a pellet into the breach using the inertia of the recoil when shooting the air rifle. The second generation 10X offers smoother operation and improved accuracy for an unprecedented shooting experience.', 999997, 0, 'img/product/s-l640.jpg', 16, '2020-08-20', 103, 'Gamo Swarm Maxxim G2 Air Rifle with Scope', '2020-08-21 15:35:03', 1),
(18, 100000, 'this is good pro', 99, 0, 'img/product/anh-dep-thien-nhien-the-gioi-01.jpg', 16, '2020-08-23', 0, 'Sầu riêng phun thuốc độc', '2020-08-23 17:14:25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'ADMIN'),
(2, 'USER');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(50) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `fullname` text NOT NULL,
  `address` text NOT NULL,
  `phone` text NOT NULL,
  `image` text DEFAULT 'img/user_default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `fullname`, `address`, `phone`, `image`) VALUES
('1aed7ae1b16a7ad96d7972c86815547f', 'admin', '12345678', 'Trần Nguyễn Tấn Sang', '22 duong 7 quan 9', '0583217159', 'img/user_default.jpg'),
('f7f6b83e8f1ed4b1081c31ecab0d0ae5', 'user', '12345678', 'Nguyen Van A', '232/3, Long Thuan, Long', '271-487-226', 'img/user_default.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `user_id` varchar(50) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
('1aed7ae1b16a7ad96d7972c86815547f', 1),
('f7f6b83e8f1ed4b1081c31ecab0d0ae5', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cus_order`
--
ALTER TABLE `cus_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cus_order_ibfk_1` (`user_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`pro_id`,`order_id`),
  ADD KEY `order_detail_ibfk_1` (`order_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_ibfk_1` (`cat_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`) USING HASH;

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `cus_order`
--
ALTER TABLE `cus_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cus_order`
--
ALTER TABLE `cus_order`
  ADD CONSTRAINT `cus_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `cus_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`pro_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
