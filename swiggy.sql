-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2018 at 05:47 PM
-- Server version: 10.1.22-MariaDB
-- PHP Version: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `swiggy`
--

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addon_products`
--

CREATE TABLE `addon_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `addon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `avatar`, `email`, `phone`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', NULL, 'admin@foodie.com', '+911234565434', '$2y$10$0ug7sW0pRNy3TWRVmCPYUeZs8lukB8DCG7MrWU5T4rWGyV96pqt/e', 'BvDN2E2BqR7Ac2QxpG4hUmfXHfdgzxP6ydMgBdusZZ1gJrlocgemVCxH9UxH', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `card_type` enum('stripe','braintree') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'stripe',
  `last_four` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_addons`
--

CREATE TABLE `cart_addons` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_cart_id` int(11) NOT NULL,
  `addon_product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `shop_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) DEFAULT NULL,
  `status` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `shop_id`, `name`, `description`, `position`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 1, 'Appetizer', 'special', NULL, 'enabled', NULL, NULL, NULL),
(2, 0, 1, 'Meat and Game Birds', 'special', NULL, 'enabled', NULL, NULL, NULL),
(3, 0, 1, 'Dessert', 'special', NULL, 'enabled', NULL, NULL, NULL),
(4, 0, 2, 'Burgers', 'special', NULL, 'enabled', NULL, NULL, NULL),
(5, 0, 2, 'Sandwitch', 'special', NULL, 'enabled', NULL, NULL, NULL),
(6, 0, 2, 'Snacks', 'special', NULL, 'enabled', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_images`
--

CREATE TABLE `category_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

CREATE TABLE `category_product` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_product`
--

INSERT INTO `category_product` (`category_id`, `product_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `cuisines`
--

CREATE TABLE `cuisines` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cuisines`
--

INSERT INTO `cuisines` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'INDIAN', NULL, NULL, NULL),
(2, 'SOUTH INDIAN', NULL, NULL, NULL),
(3, 'BENGOLI', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cuisine_shop`
--

CREATE TABLE `cuisine_shop` (
  `cuisine_id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cuisine_shop`
--

INSERT INTO `cuisine_shop` (`cuisine_id`, `shop_id`) VALUES
(1, 1),
(2, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `custom_pushes`
--

CREATE TABLE `custom_pushes` (
  `id` int(10) UNSIGNED NOT NULL,
  `send_to` enum('ALL','USERS','PROVIDERS') COLLATE utf8mb4_unicode_ci NOT NULL,
  `condition` enum('ACTIVE','LOCATION','RIDES','AMOUNT') COLLATE utf8mb4_unicode_ci NOT NULL,
  `condition_data` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_to` int(11) NOT NULL DEFAULT '0',
  `schedule_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('DRIVER','VEHICLE') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_transporters`
--

CREATE TABLE `enquiry_transporters` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2015_08_25_172600_create_settings_table', 1),
(4, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(5, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(6, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(7, '2016_06_01_000004_create_oauth_clients_table', 1),
(8, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(9, '2017_01_11_181312_create_cards_table', 1),
(10, '2017_01_11_182717_create_request_filters_table', 1),
(11, '2017_06_08_123940_create_admins_table', 1),
(12, '2017_06_08_123941_create_admin_password_resets_table', 1),
(13, '2017_06_09_044823_create_shops_table', 1),
(14, '2017_06_09_044824_create_shop_password_resets_table', 1),
(15, '2017_06_09_045212_create_transporters_table', 1),
(16, '2017_06_09_045213_create_transporter_password_resets_table', 1),
(17, '2017_06_09_102917_create_products_table', 1),
(18, '2017_06_09_105225_create_categories_table', 1),
(19, '2017_06_12_064740_create_user_addresses_table', 1),
(20, '2017_06_12_101042_create_orders_table', 1),
(21, '2017_06_12_101114_create_order_invoices_table', 1),
(22, '2017_06_12_101147_create_order_ratings_table', 1),
(23, '2017_06_12_101212_create_order_disputes_table', 1),
(24, '2017_06_12_101253_create_promocodes_table', 1),
(25, '2017_06_12_101446_create_surge_pricings_table', 1),
(26, '2017_06_12_113225_create_notifications_table', 1),
(27, '2017_06_13_124334_create_zones_table', 1),
(28, '2017_06_13_125525_create_transporter_documents_table', 1),
(29, '2017_06_13_130530_create_category_images_table', 1),
(30, '2017_06_15_115211_create_product_images_table', 1),
(31, '2017_06_15_115323_create_product_prices_table', 1),
(32, '2017_06_16_112721_create_user_carts_table', 1),
(33, '2017_06_23_124807_create_oauth_access_token_guards', 1),
(34, '2017_08_03_194354_create_custom_pushes_table', 1),
(35, '2017_09_19_053529_create_cuisines_table', 1),
(36, '2017_09_19_053543_create_documents_table', 1),
(37, '2017_09_19_053556_create_order_dispute_comments_table', 1),
(38, '2017_09_19_053608_create_promocode_usages_table', 1),
(39, '2017_09_19_053619_create_transporter_vehicles_table', 1),
(40, '2017_09_19_053635_create_transporter_shifts_table', 1),
(41, '2017_09_19_053648_create_transporter_shift_timings_table', 1),
(42, '2017_09_19_053659_create_wallet_passbooks_table', 1),
(43, '2017_09_19_110911_create_shop_timings_table', 1),
(44, '2017_09_25_125459_create_transporter_locations_table', 1),
(45, '2017_10_04_130254_create_order_timings_table', 1),
(46, '2017_10_07_103112_create_favorites_table', 1),
(47, '2017_10_12_122111_create_shop_banners_table', 1),
(48, '2017_10_13_062225_create_notice_boards_table', 1),
(49, '2017_10_20_070027_create_order_dispute_helps_table', 1),
(50, '2017_10_21_063643_create_permission_tables', 1),
(51, '2017_11_06_111106_create_addons_table', 1),
(52, '2017_11_08_121819_create_cart_addons_table', 1),
(53, '2017_11_08_133602_create_enquiry_transporters_table', 1),
(54, '2017_11_09_062754_create_addon_products_table', 1),
(55, '2017_11_27_142447_create_restuarants_table', 1),
(56, '2017_11_28_063349_create_newsletters_table', 1),
(57, '2017_12_05_043339_add_delivery_date_to_orders', 1),
(58, '2017_12_06_091412_add_schedule_status_to_orders', 1),
(59, '2018_02_01_105814_create_favourites_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_id`, `model_type`) VALUES
(1, 1, 'App\\Admin');

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notice_boards`
--

CREATE TABLE `notice_boards` (
  `id` int(10) UNSIGNED NOT NULL,
  `transporter_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notice` text COLLATE utf8mb4_unicode_ci,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `transporter_id` int(11) NOT NULL DEFAULT '0',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_token_providers`
--

CREATE TABLE `oauth_access_token_providers` (
  `oauth_access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Foodie Personal Access Client', '8sZmthmAo1X7Ww17G7vuxZg1pyaxOwhClA2adAK3', 'http://localhost', 1, 0, 0, '2018-10-31 11:54:30', '2018-10-31 11:54:30'),
(2, NULL, 'Foodie Password Grant Client', '5UaEhYYYf94R8Dyh27uyKVeVrWvQFPpsqcHS3TF9', 'http://localhost', 0, 1, 0, '2018-10-31 11:54:30', '2018-10-31 11:54:30'),
(3, NULL, 'Foodie Personal Access Client', 'ZLMPVlBBOFdVorp1CwtKJefVFWCH1KBZpCevLjQA', 'http://localhost', 1, 0, 0, '2018-10-31 12:36:30', '2018-10-31 12:36:30'),
(4, NULL, 'Foodie Password Grant Client', 'JAUGVqhSkA6zpFifJRuwqyDuujReYa1I0s62YFdQ', 'http://localhost', 0, 1, 0, '2018-10-31 12:36:31', '2018-10-31 12:36:31');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2018-10-31 11:54:30', '2018-10-31 11:54:30'),
(2, 3, '2018-10-31 12:36:30', '2018-10-31 12:36:30');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `shift_id` int(11) DEFAULT NULL,
  `user_address_id` int(11) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `transporter_id` int(11) DEFAULT NULL,
  `transporter_vehicle_id` int(11) DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
  `route_key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dispute` enum('CREATED','RESOLVE','NODISPUTE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NODISPUTE',
  `delivery_date` datetime NOT NULL,
  `order_otp` int(11) NOT NULL,
  `order_ready_time` int(11) NOT NULL DEFAULT '0',
  `order_ready_status` int(11) NOT NULL DEFAULT '0',
  `status` enum('ORDERED','RECEIVED','CANCELLED','ASSIGNED','PROCESSING','SEARCHING','REACHED','PICKEDUP','ARRIVED','COMPLETED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ORDERED',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `schedule_status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_disputes`
--

CREATE TABLE `order_disputes` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_disputehelp_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `transporter_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `type` enum('CANCELLED','COMPLAINED','REFUND','REASSIGN') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` enum('user','shop','transporter') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_to` enum('user','shop','transporter','dispatcher') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('CREATED','RESOLVED') COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_dispute_comments`
--

CREATE TABLE `order_dispute_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `admin_id` int(11) NOT NULL,
  `order_dispute_id` int(11) NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_dispute_helps`
--

CREATE TABLE `order_dispute_helps` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('CANCELLED','COMPLAINED','REFUND','REASSIGN') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_invoices`
--

CREATE TABLE `order_invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `paid` int(11) NOT NULL DEFAULT '0',
  `gross` double(10,2) NOT NULL DEFAULT '0.00',
  `discount` double(10,2) NOT NULL DEFAULT '0.00',
  `delivery_charge` double(10,2) NOT NULL DEFAULT '0.00',
  `wallet_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `payable` int(11) NOT NULL DEFAULT '0',
  `tax` double(10,2) NOT NULL DEFAULT '0.00',
  `net` int(11) NOT NULL DEFAULT '0',
  `total_pay` double NOT NULL DEFAULT '0',
  `tender_pay` double NOT NULL DEFAULT '0',
  `ripple_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_mode` enum('cash','stripe','paypal','braintree','wallet','ripple','eather','bitcoin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cash',
  `payment_id` text COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','processing','failed','success') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_ratings`
--

CREATE TABLE `order_ratings` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_rating` int(11) DEFAULT NULL,
  `user_comment` text COLLATE utf8mb4_unicode_ci,
  `transporter_id` int(11) DEFAULT NULL,
  `transporter_rating` int(11) DEFAULT NULL,
  `transporter_comment` text COLLATE utf8mb4_unicode_ci,
  `shop_id` int(11) DEFAULT NULL,
  `shop_rating` int(11) DEFAULT NULL,
  `shop_comment` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_timings`
--

CREATE TABLE `order_timings` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `status` enum('ORDERED','RECEIVED','CANCELLED','ASSIGNED','PROCESSING','REACHED','PICKEDUP','ARRIVED','COMPLETED','SEARCHING') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT '0',
  `shop_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) DEFAULT NULL,
  `food_type` enum('veg','non-veg') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'veg',
  `avalability` tinyint(1) NOT NULL DEFAULT '0',
  `max_quantity` int(11) NOT NULL DEFAULT '10',
  `featured` int(11) NOT NULL DEFAULT '0',
  `addon_status` int(11) NOT NULL DEFAULT '0',
  `status` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `parent_id`, `shop_id`, `name`, `description`, `position`, `food_type`, `avalability`, `max_quantity`, `featured`, `addon_status`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 1, 'Crispy farm egg gribs', 'special', NULL, 'veg', 0, 10, 0, 0, 'enabled', NULL, NULL, NULL),
(2, 0, 1, 'Coconut thai curry with shirump', 'special', NULL, 'veg', 0, 10, 0, 0, 'enabled', NULL, NULL, NULL),
(3, 0, 1, 'Baked choclate shuffle', 'special', NULL, 'veg', 0, 10, 0, 0, 'enabled', NULL, NULL, NULL),
(4, 0, 2, 'Big mac', 'special', NULL, 'veg', 0, 10, 0, 0, 'enabled', NULL, NULL, NULL),
(5, 0, 2, 'Chicken Sandwitch', 'special', NULL, 'veg', 0, 10, 0, 0, 'enabled', NULL, NULL, NULL),
(6, 0, 2, 'Apple slice', 'special', NULL, 'veg', 0, 10, 0, 0, 'enabled', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_prices`
--

CREATE TABLE `product_prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `discount_type` enum('percentage','amount') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_prices`
--

INSERT INTO `product_prices` (`id`, `product_id`, `price`, `currency`, `discount`, `discount_type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 100, NULL, 0, 'percentage', NULL, NULL, NULL),
(2, 2, 100, NULL, 0, 'percentage', NULL, NULL, NULL),
(3, 3, 100, NULL, 0, 'percentage', NULL, NULL, NULL),
(4, 4, 100, NULL, 0, 'percentage', NULL, NULL, NULL),
(5, 5, 100, NULL, 0, 'percentage', NULL, NULL, NULL),
(6, 6, 100, NULL, 0, 'percentage', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `promocodes`
--

CREATE TABLE `promocodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `promo_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `promocode_type` enum('amount','percent') COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` double(10,2) NOT NULL DEFAULT '0.00',
  `expiration` datetime NOT NULL,
  `status` enum('ADDED','EXPIRED') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promocode_usages`
--

CREATE TABLE `promocode_usages` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `promocode_id` int(11) NOT NULL,
  `status` enum('ADDED','USED','EXPIRED') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request_filters`
--

CREATE TABLE `request_filters` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restuarants`
--

CREATE TABLE `restuarants` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hours_opening` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hours_closing` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', NULL, NULL),
(2, 'Dispute Manager', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(1, 'site_title', 'Foodie'),
(2, 'site_logo', 'http://localhost/logo-black.png'),
(3, 'site_favicon', 'http://localhost/logo-black.png'),
(4, 'site_copyright', '&copy; 2018 Appoets'),
(5, 'delivery_charge', '20'),
(6, 'resturant_response_time', '5'),
(7, 'currency', '$'),
(8, 'currency_code', 'USD'),
(9, 'search_distance', '10'),
(10, 'tax', '10'),
(11, 'payment_mode', 'CASH'),
(12, 'manual_assign', '0'),
(13, 'transporter_response_time', '30'),
(14, 'GOOGLE_MAP_KEY', 'AIzaSyBDkKetQwosod2SZ7ZGCpxuJdxY3kxo5Po'),
(15, 'TWILIO_SID', ''),
(16, 'TWILIO_TOKEN', ''),
(17, 'TWILIO_FROM', ''),
(18, 'PUBNUB_PUB_KEY', ''),
(19, 'PUBNUB_SUB_KEY', ''),
(20, 'stripe_charge', '0'),
(21, 'stripe_publishable_key', 'pk_test_39kly6aEfUEfvMpRnN6BnxLb'),
(22, 'stripe_secret_key', 'sk_test_I1OGCnG8zVIXCC7sSImIJsOy'),
(23, 'FB_CLIENT_ID', '290984818086469'),
(24, 'FB_CLIENT_SECRET', '1f52cb4378e623bb819cd8469e408482'),
(25, 'FB_REDIRECT', 'http://localhost'),
(26, 'GOOGLE_CLIENT_ID', '299256700052-rts0nr0a49dutr831oin38aj7mjju2ua.apps.googleusercontent.com'),
(27, 'GOOGLE_CLIENT_SECRET', 'FL0YR5dw9RuV6OdI8IkkI9oS'),
(28, 'GOOGLE_REDIRECT', 'http://localhost'),
(29, 'GOOGLE_API_KEY', 'AIzaSyAKGFZT_5uhpOOkma-GBOPamDw_mRIB-p8'),
(30, 'ANDROID_ENV', 'development'),
(31, 'ANDROID_PUSH_KEY', 'AIzaSyBzvWOtvpuNXBKp6vxBBRMizNJj_1wIQVg'),
(32, 'IOS_USER_ENV', 'development'),
(33, 'IOS_PROVIDER_ENV', 'development'),
(34, 'DEMO_MODE', '1'),
(35, 'SUB_CATEGORY', '0'),
(36, 'SCHEDULE_ORDER', '0'),
(37, 'client_id', '2'),
(38, 'client_secret', '0'),
(39, 'PRODUCT_ADDONS', '0'),
(40, 'BRAINTREE_ENV', 'sandbox'),
(41, 'BRAINTREE_MERCHANT_ID', 'twbd779hfc859jxq'),
(42, 'BRAINTREE_PUBLIC_KEY', '7bn6hystx7vs2g8r'),
(43, 'BRAINTREE_PRIVATE_KEY', '721e48cc74fdf2dfaacc6c3410de2f27'),
(44, 'RIPPLE_KEY', 'rEsaDShsYPmMZopoG3nNjutWJCk1Zn9cbX'),
(45, 'RIPPLE_BARCODE', 'http://localhost/images/ripple.png'),
(46, 'ETHER_ADMIN_KEY', '0x16abb22fd68c25286d72e77226ddaad87323cbb1'),
(47, 'ETHER_KEY', 'R92FW87ER1QZIDYX1UHTVBY625T8HCPKNR'),
(48, 'ETHER_BARCODE', 'http://localhost/images/ether.jpeg'),
(49, 'CLIENT_AUTHORIZATION', 'sandbox_v5r97hvk_twbd779hfc859jxq'),
(50, 'SOCIAL_FACEBOOK_LINK', 'http://facebook.com'),
(51, 'SOCIAL_TWITTER_LINK', 'http://twitter.com'),
(52, 'SOCIAL_G-PLUS_LINK', 'http://google.com'),
(53, 'SOCIAL_INSTAGRAM_LINK', 'http://instagram.com'),
(54, 'SOCIAL_PINTEREST_LINK', 'http://pinterest.com'),
(55, 'SOCIAL_VIMEO_LINK', 'http://vimeo.com'),
(56, 'SOCIAL_YOUTUBE_LINK', 'http://youtube.com'),
(57, 'COMMISION_OVER_FOOD', '5'),
(58, 'COMMISION_OVER_DELIVERY_FEE', '10'),
(59, 'APP_STORE_LINK', 'https://itunes.apple.com/us/app/foodie-express-food-delivery/id1296870125?mt=8'),
(60, 'GOOGLE_PLAY_LINK', 'https://play.google.com/store/apps/details?id=com.foodie.app&hl=en');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_min_amount` double(20,2) NOT NULL DEFAULT '0.00',
  `offer_percent` int(11) DEFAULT '0',
  `estimated_delivery_time` int(11) DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `maps_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double(15,8) NOT NULL,
  `longitude` double(15,8) NOT NULL,
  `pure_veg` tinyint(1) NOT NULL DEFAULT '0',
  `rating` int(11) DEFAULT '0',
  `rating_status` int(11) NOT NULL DEFAULT '0',
  `status` enum('onboarding','banned','active') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'onboarding',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `name`, `email`, `password`, `phone`, `avatar`, `default_banner`, `description`, `offer_min_amount`, `offer_percent`, `estimated_delivery_time`, `address`, `maps_address`, `latitude`, `longitude`, `pure_veg`, `rating`, `rating_status`, `status`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Gary danko', 'demo@foodie.com', '$2y$10$PYygJCV0KOPuplSpTRgrMumaiOoqvsre/r4rwlnWHcuiwGL2RSmsW', '8765654345', NULL, NULL, 'good resturant', 0.00, 0, 30, 'Triplicane, Chennai, Tamil Nadu, India', 'Triplicane, Chennai, Tamil Nadu, India', 13.05871070, 80.27570630, 0, 0, 0, 'onboarding', NULL, NULL, NULL, NULL),
(2, 'Mcdonald', 'demo2@foodie.com', '$2y$10$K21R9GBcbZOKTCTMB7WUruoCZrTeKWVl83KgB9ZH87paNllR2jA0G', '8768884345', NULL, NULL, 'good resturant', 0.00, 0, 30, 'Triplicane, Chennai, Tamil Nadu, India', 'Triplicane, Chennai, Tamil Nadu, India', 13.05871070, 80.27570630, 0, 0, 0, 'onboarding', NULL, NULL, NULL, NULL),
(3, 'wfef', 'rishabhmehta98@gmail.com', '$2y$10$/hI3BwvdpBduVFheMyy9tuJOorAVyzLp6LG.x1KLc34FRske1TsUS', '7976614292', 'http://127.0.0.1:8000/storage/shops/pdnhyv2T6h9hfYS3OC1787HRomEh7Ni2NL6m0mdU.jpeg', NULL, 'asdsadas', 22.00, NULL, 22, 'Jaipur, Rajasthan, India', 'Jaipur, Rajasthan, India', 26.91243360, 75.78727090, 0, 0, 0, 'onboarding', NULL, '2018-11-04 06:28:11', '2018-11-04 06:28:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shop_banners`
--

CREATE TABLE `shop_banners` (
  `id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_password_resets`
--

CREATE TABLE `shop_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_timings`
--

CREATE TABLE `shop_timings` (
  `id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(11) NOT NULL,
  `start_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` enum('ALL','SUN','MON','TUE','WED','THU','FRI','SAT') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ALL',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_timings`
--

INSERT INTO `shop_timings` (`id`, `shop_id`, `start_time`, `end_time`, `day`, `created_at`, `updated_at`) VALUES
(1, 1, '08:00', '20:00', 'ALL', NULL, NULL),
(2, 2, '08:00', '20:00', 'ALL', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `surge_pricings`
--

CREATE TABLE `surge_pricings` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transporters`
--

CREATE TABLE `transporters` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `latitude` double(15,8) NOT NULL DEFAULT '0.00000000',
  `longitude` double(15,8) NOT NULL DEFAULT '0.00000000',
  `otp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `rating` int(11) NOT NULL DEFAULT '5',
  `device_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` enum('android','ios') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('assessing','banned','online','offline','riding','unsettled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'assessing',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transporters`
--

INSERT INTO `transporters` (`id`, `name`, `email`, `phone`, `password`, `avatar`, `address`, `latitude`, `longitude`, `otp`, `rating`, `device_token`, `device_id`, `device_type`, `status`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Demo User', 'demo@foodie.com', '+919898765654', '$2y$10$Q3bMRaiE5GMa.4k0oxYMrOGTZ7FYM42BagrsJKnbBQ6Pl4HorNwxS', NULL, NULL, 0.00000000, 0.00000000, '0', 5, NULL, NULL, NULL, 'assessing', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transporter_documents`
--

CREATE TABLE `transporter_documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `transporter_id` int(11) NOT NULL,
  `document_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unique_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ASSESSING','ACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transporter_locations`
--

CREATE TABLE `transporter_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `transporter_id` int(11) NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double(15,8) NOT NULL,
  `longitude` double(15,8) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transporter_password_resets`
--

CREATE TABLE `transporter_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transporter_shifts`
--

CREATE TABLE `transporter_shifts` (
  `id` int(10) UNSIGNED NOT NULL,
  `transporter_id` int(11) NOT NULL,
  `transporter_vehicle_id` int(11) NOT NULL,
  `total_order` int(11) NOT NULL DEFAULT '0',
  `start_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transporter_shift_timings`
--

CREATE TABLE `transporter_shift_timings` (
  `id` int(10) UNSIGNED NOT NULL,
  `transporter_shift_id` int(11) NOT NULL,
  `start_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transporter_vehicles`
--

CREATE TABLE `transporter_vehicles` (
  `id` int(10) UNSIGNED NOT NULL,
  `transporter_id` int(11) NOT NULL,
  `vehicle_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` enum('android','ios') COLLATE utf8mb4_unicode_ci NOT NULL,
  `login_by` enum('manual','facebook','google') COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_unique_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_cust_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wallet_balance` double(8,2) NOT NULL DEFAULT '0.00',
  `otp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `braintree_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `avatar`, `password`, `device_token`, `device_id`, `device_type`, `login_by`, `social_unique_id`, `stripe_cust_id`, `wallet_balance`, `otp`, `braintree_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Demo User', 'demo@foodie.com', '+915454545454', NULL, '$2y$10$TyI3GcAUfvpEXMnnCMWVielpVvk9Ofe.rJJiNyXoD8uWKg2Bff7KW', NULL, NULL, 'ios', 'manual', NULL, NULL, 0.00, '0', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `building` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pincode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landmark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double(15,8) NOT NULL,
  `longitude` double(15,8) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_carts`
--

CREATE TABLE `user_carts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `promocode_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `savedforlater` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_passbooks`
--

CREATE TABLE `wallet_passbooks` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('CREDITED','DEBITED') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `north_east_lat` double(15,8) NOT NULL,
  `north_east_lng` double(15,8) NOT NULL,
  `south_west_lat` double(15,8) NOT NULL,
  `south_west_lng` double(15,8) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addon_products`
--
ALTER TABLE `addon_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `admins_phone_unique` (`phone`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD KEY `admin_password_resets_email_index` (`email`),
  ADD KEY `admin_password_resets_token_index` (`token`);

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_addons`
--
ALTER TABLE `cart_addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_images`
--
ALTER TABLE `category_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_product_category_id_foreign` (`category_id`);

--
-- Indexes for table `cuisines`
--
ALTER TABLE `cuisines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cuisine_shop`
--
ALTER TABLE `cuisine_shop`
  ADD PRIMARY KEY (`shop_id`,`cuisine_id`),
  ADD KEY `cuisine_shop_cuisine_id_foreign` (`cuisine_id`);

--
-- Indexes for table `custom_pushes`
--
ALTER TABLE `custom_pushes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiry_transporters`
--
ALTER TABLE `enquiry_transporters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notice_boards`
--
ALTER TABLE `notice_boards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_access_token_providers`
--
ALTER TABLE `oauth_access_token_providers`
  ADD PRIMARY KEY (`oauth_access_token_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_disputes`
--
ALTER TABLE `order_disputes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_dispute_comments`
--
ALTER TABLE `order_dispute_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_dispute_helps`
--
ALTER TABLE `order_dispute_helps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_invoices`
--
ALTER TABLE `order_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_ratings`
--
ALTER TABLE `order_ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_timings`
--
ALTER TABLE `order_timings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_prices`
--
ALTER TABLE `product_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promocodes`
--
ALTER TABLE `promocodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promocode_usages`
--
ALTER TABLE `promocode_usages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_filters`
--
ALTER TABLE `request_filters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restuarants`
--
ALTER TABLE `restuarants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `restuarants_email_unique` (`email`),
  ADD UNIQUE KEY `restuarants_phone_unique` (`phone`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_key_index` (`key`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shops_email_unique` (`email`);

--
-- Indexes for table `shop_banners`
--
ALTER TABLE `shop_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_password_resets`
--
ALTER TABLE `shop_password_resets`
  ADD KEY `shop_password_resets_email_index` (`email`),
  ADD KEY `shop_password_resets_token_index` (`token`);

--
-- Indexes for table `shop_timings`
--
ALTER TABLE `shop_timings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surge_pricings`
--
ALTER TABLE `surge_pricings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transporters`
--
ALTER TABLE `transporters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transporters_email_unique` (`email`),
  ADD UNIQUE KEY `transporters_phone_unique` (`phone`);

--
-- Indexes for table `transporter_documents`
--
ALTER TABLE `transporter_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transporter_locations`
--
ALTER TABLE `transporter_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transporter_password_resets`
--
ALTER TABLE `transporter_password_resets`
  ADD KEY `transporter_password_resets_email_index` (`email`),
  ADD KEY `transporter_password_resets_token_index` (`token`);

--
-- Indexes for table `transporter_shifts`
--
ALTER TABLE `transporter_shifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transporter_shift_timings`
--
ALTER TABLE `transporter_shift_timings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transporter_vehicles`
--
ALTER TABLE `transporter_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_carts`
--
ALTER TABLE `user_carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_passbooks`
--
ALTER TABLE `wallet_passbooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `addon_products`
--
ALTER TABLE `addon_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cart_addons`
--
ALTER TABLE `cart_addons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `category_images`
--
ALTER TABLE `category_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cuisines`
--
ALTER TABLE `cuisines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `custom_pushes`
--
ALTER TABLE `custom_pushes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `enquiry_transporters`
--
ALTER TABLE `enquiry_transporters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `favourites`
--
ALTER TABLE `favourites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notice_boards`
--
ALTER TABLE `notice_boards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_disputes`
--
ALTER TABLE `order_disputes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_dispute_comments`
--
ALTER TABLE `order_dispute_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_dispute_helps`
--
ALTER TABLE `order_dispute_helps`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_invoices`
--
ALTER TABLE `order_invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_ratings`
--
ALTER TABLE `order_ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_timings`
--
ALTER TABLE `order_timings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_prices`
--
ALTER TABLE `product_prices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `promocodes`
--
ALTER TABLE `promocodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `promocode_usages`
--
ALTER TABLE `promocode_usages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `request_filters`
--
ALTER TABLE `request_filters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `restuarants`
--
ALTER TABLE `restuarants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `shop_banners`
--
ALTER TABLE `shop_banners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shop_timings`
--
ALTER TABLE `shop_timings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `surge_pricings`
--
ALTER TABLE `surge_pricings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transporters`
--
ALTER TABLE `transporters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `transporter_documents`
--
ALTER TABLE `transporter_documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transporter_locations`
--
ALTER TABLE `transporter_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transporter_shifts`
--
ALTER TABLE `transporter_shifts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transporter_shift_timings`
--
ALTER TABLE `transporter_shift_timings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transporter_vehicles`
--
ALTER TABLE `transporter_vehicles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_carts`
--
ALTER TABLE `user_carts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wallet_passbooks`
--
ALTER TABLE `wallet_passbooks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cuisine_shop`
--
ALTER TABLE `cuisine_shop`
  ADD CONSTRAINT `cuisine_shop_cuisine_id_foreign` FOREIGN KEY (`cuisine_id`) REFERENCES `cuisines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cuisine_shop_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `oauth_access_token_providers`
--
ALTER TABLE `oauth_access_token_providers`
  ADD CONSTRAINT `oauth_access_token_providers_oauth_access_token_id_foreign` FOREIGN KEY (`oauth_access_token_id`) REFERENCES `oauth_access_tokens` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
