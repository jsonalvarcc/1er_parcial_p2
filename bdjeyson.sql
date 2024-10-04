-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-10-2024 a las 03:40:55
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdjeyson`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catastro`
--

CREATE TABLE `catastro` (
  `id` int(11) NOT NULL,
  `codigo_catastral` varchar(50) NOT NULL,
  `xini` decimal(10,2) NOT NULL,
  `yini` decimal(10,2) NOT NULL,
  `xfin` decimal(10,2) NOT NULL,
  `yfin` decimal(10,2) NOT NULL,
  `cod_distrito` int(11) DEFAULT NULL,
  `cod_persona` int(11) DEFAULT NULL,
  `superficie` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `catastro`
--

INSERT INTO `catastro` (`id`, `codigo_catastral`, `xini`, `yini`, `xfin`, `yfin`, `cod_distrito`, `cod_persona`, `superficie`) VALUES
(7, '10001', 14.00, 22.00, 18.00, 26.00, 1, 1, 10222.00),
(8, '10002', 15.50, 23.50, 19.50, 27.50, 2, 2, 111221.00),
(9, '20001', 16.00, 24.00, 20.00, 28.00, 1, 3, 45772.00),
(10, '20002', 17.50, 25.50, 21.50, 29.50, 3, 4, 27.00),
(11, '30000', 18.00, 26.00, 22.00, 30.00, 2, 5, 7525.00),
(12, '20000', 5.00, 22.50, 18.50, 26.50, 1, 1, 8778.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distrito`
--

CREATE TABLE `distrito` (
  `cod_distrito` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `distrito`
--

INSERT INTO `distrito` (`cod_distrito`, `nombre`) VALUES
(1, 'Cotahuma'),
(2, 'Max Paredes'),
(3, 'Periferica'),
(4, 'San Antonio'),
(5, 'Sur'),
(6, 'Mallasa'),
(7, 'Centro'),
(8, 'Hampaturi'),
(9, 'Zongo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `cod_persona` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `ci` varchar(20) NOT NULL,
  `rol` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`cod_persona`, `nombre`, `apellidos`, `ci`, `rol`) VALUES
(1, 'Juan', 'Perez Lopez', '12345678', 'usuario'),
(2, 'Maria', 'Gonzalez Rivera', '87654321', 'usuario'),
(3, 'Carlos', 'Ramirez Flores', '34567890', 'usuario'),
(4, 'Ana', 'Martonez Soto', '23456789', 'funcionario'),
(5, 'Pedrow', 'Gutiurrez Chavez', '45678901', 'usuario'),
(6, 'Jeyson alvar', 'Carita Callizaya', '9892968', 'funcionario'),
(7, 'Marcos', 'Palacios Martines', '7854875', 'usuario');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `catastro`
--
ALTER TABLE `catastro`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo_catastral` (`codigo_catastral`),
  ADD KEY `cod_distrito` (`cod_distrito`),
  ADD KEY `cod_persona` (`cod_persona`);

--
-- Indices de la tabla `distrito`
--
ALTER TABLE `distrito`
  ADD PRIMARY KEY (`cod_distrito`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`cod_persona`),
  ADD UNIQUE KEY `ci` (`ci`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `catastro`
--
ALTER TABLE `catastro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `distrito`
--
ALTER TABLE `distrito`
  MODIFY `cod_distrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `cod_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `catastro`
--
ALTER TABLE `catastro`
  ADD CONSTRAINT `catastro_ibfk_1` FOREIGN KEY (`cod_distrito`) REFERENCES `distrito` (`cod_distrito`),
  ADD CONSTRAINT `catastro_ibfk_2` FOREIGN KEY (`cod_persona`) REFERENCES `persona` (`cod_persona`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
