testthat::context("main")
library(leaflet.opacity)
library(raster)
library(leaflet)
library(magrittr)
library(rgdal)

testthat::test_that("Initialize map dependencies in addOpacitySlider", {
  # Create artificial layer
  r <- raster(xmn = -2.8, xmx = -2.79, ymn = 54.04, ymx = 54.05, nrows = 30, ncols = 30)
  values(r) <- matrix(1:900, nrow(r), ncol(r), byrow = TRUE)
  crs(r) <- CRS("+init=epsg:4326")

  # Create leaflet map with opacity slider
  res <- leaflet() %>%
    addTiles() %>%
    addRasterImage(r, layerId = "raster", project = FALSE) %>%
    addOpacitySlider(layerId = "raster")

  expect_equal(res$dependencies[[1]]$name, "jquery-ui")
  expect_equal(res$dependencies[[2]]$name, "opacity")
})

testthat::test_that("Initialize map dependencies in addLowerOpacity", {
  # Create artificial layer
  r <- raster(xmn = -2.8, xmx = -2.79, ymn = 54.04, ymx = 54.05, nrows = 30, ncols = 30)
  values(r) <- matrix(1:900, nrow(r), ncol(r), byrow = TRUE)
  crs(r) <- CRS("+init=epsg:4326")

  # Create leaflet map with opacity slider
  res <- leaflet() %>%
    addTiles() %>%
    addRasterImage(r, layerId = "raster", project = FALSE) %>%
    addLowerOpacity(layerId = "raster")

  expect_equal(res$dependencies[[1]]$name, "jquery-ui")
  expect_equal(res$dependencies[[2]]$name, "opacity")
})

testthat::test_that("Initialize map dependencies in addHigherOpacity", {
  # Create artificial layer
  r <- raster(xmn = -2.8, xmx = -2.79, ymn = 54.04, ymx = 54.05, nrows = 30, ncols = 30)
  values(r) <- matrix(1:900, nrow(r), ncol(r), byrow = TRUE)
  crs(r) <- CRS("+init=epsg:4326")

  # Create leaflet map with opacity slider
  res <- leaflet() %>%
    addTiles() %>%
    addRasterImage(r, layerId = "raster", project = FALSE) %>%
    addHigherOpacity(layerId = "raster")

  expect_equal(res$dependencies[[1]]$name, "jquery-ui")
  expect_equal(res$dependencies[[2]]$name, "opacity")
})

testthat::test_that("Add javascript code with addOpacitySlider", {
  # Create artificial layer
  r <- raster(xmn = -2.8, xmx = -2.79, ymn = 54.04, ymx = 54.05, nrows = 30, ncols = 30)
  values(r) <- matrix(1:900, nrow(r), ncol(r), byrow = TRUE)
  crs(r) <- CRS("+init=epsg:4326")

  # Create leaflet map with opacity slider
  res <- leaflet() %>%
    addTiles() %>%
    addRasterImage(r, layerId = "raster", project = FALSE) %>%
    addOpacitySlider(layerId = "raster")

  expect_match(res$jsHooks$render[[1]]$code[[1]], "function\\(el,x,data\\).*")
})

testthat::test_that("Add javascript code with addLowerOpacity", {
  # Create artificial layer
  r <- raster(xmn = -2.8, xmx = -2.79, ymn = 54.04, ymx = 54.05, nrows = 30, ncols = 30)
  values(r) <- matrix(1:900, nrow(r), ncol(r), byrow = TRUE)
  crs(r) <- CRS("+init=epsg:4326")

  # Create leaflet map with opacity slider
  res <- leaflet() %>%
    addTiles() %>%
    addRasterImage(r, layerId = "raster", project = FALSE) %>%
    addLowerOpacity(layerId = "raster")

  expect_match(res$jsHooks$render[[1]]$code[[1]], "function\\(el,x,data\\).*")
})

testthat::test_that("Add javascript code with addHigherOpacity", {
  # Create artificial layer
  r <- raster(xmn = -2.8, xmx = -2.79, ymn = 54.04, ymx = 54.05, nrows = 30, ncols = 30)
  values(r) <- matrix(1:900, nrow(r), ncol(r), byrow = TRUE)
  crs(r) <- CRS("+init=epsg:4326")

  # Create leaflet map with opacity slider
  res <- leaflet() %>%
    addTiles() %>%
    addRasterImage(r, layerId = "raster", project = FALSE) %>%
    addHigherOpacity(layerId = "raster")

  expect_match(res$jsHooks$render[[1]]$code[[1]], "function\\(el,x,data\\).*")
})

