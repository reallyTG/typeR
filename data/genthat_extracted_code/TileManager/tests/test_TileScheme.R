library(TileManager)

context("Tests for TileScheme")

### LOAD TEST DATA

data(CHMdemo)
emptyRas <- raster::setValues(CHMdemo, NA)
extDemo <- raster::extent(CHMdemo)

### PERFORM TESTS

test_that("TileScheme performs as expected using \'dimByCell\' with no buffers", {

  tile.bycell <- TileScheme(CHMdemo, dimByCell = c(200,300), removeEmpty = TRUE)

  # Expected size of a the first tile
  expect_identical(rgeos::gArea(tile.bycell$tilePolygons[1,]), 3750)
  expect_identical(rgeos::gArea(tile.bycell$buffPolygons[1,]), 3750)
  expect_identical(rgeos::gArea(tile.bycell$nbuffPolygons[1,]), 3750)

  # Expected size of the entire tile set
  expect_equal(rgeos::gArea(tile.bycell$tilePolygons), 13591.88, tolerance = 0.000001)
  expect_equal(rgeos::gArea(tile.bycell$buffPolygons), 13591.88, tolerance = 0.000001)
  expect_equal(rgeos::gArea(tile.bycell$nbuffPolygons), 13591.88, tolerance = 0.000001)

  # Expected number of tiles
  expect_equal(length(tile.bycell$tilePolygons), 5)
  expect_equal(length(tile.bycell$buffPolygons), 5)
  expect_equal(length(tile.bycell$nbuffPolygons), 5)

})

test_that("TileScheme performs as expected using \'dimByCell\' with buffers", {

  tile.bycell2 <- TileScheme(CHMdemo, dimByCell = c(100,100), buffer = 5, removeEmpty = TRUE)

  # Expected size of a the first tile
  expect_identical(rgeos::gArea(tile.bycell2$tilePolygons[1,]), 625)
  expect_identical(rgeos::gArea(tile.bycell2$buffPolygons[1,]), 756.25)

  # Expectecd size of non-overlapping buffer tiles
  expect_equal(rgeos::gArea(tile.bycell2$nbuffPolygons[1,]), 721.0938, tolerance = 0.000001)
  expect_equal(rgeos::gArea(tile.bycell2$nbuffPolygons[2,]), 656.25, tolerance = 0.000001)
  expect_equal(rgeos::gArea(tile.bycell2$nbuffPolygons[5,]), 433.125, tolerance = 0.000001)
  expect_equal(rgeos::gArea(tile.bycell2$nbuffPolygons[10,]), 720.3125, tolerance = 0.000001)

  # Expected size of the entire tile set
  expect_equal(rgeos::gArea(tile.bycell2$tilePolygons), 11885, tolerance = 0.000001)
  expect_equal(rgeos::gArea(tile.bycell2$buffPolygons), 14576.25, tolerance = 0.000001)
  expect_equal(rgeos::gArea(tile.bycell2$nbuffPolygons), 12591.88, tolerance = 0.000001)

  # Expected number of tiles
  expect_equal(length(tile.bycell2$tilePolygons), 22)
  expect_equal(length(tile.bycell2$buffPolygons), 22)
  expect_equal(length(tile.bycell2$nbuffPolygons), 22)

})


test_that("TileScheme performs as expected using \'dimByDist\' with buffers", {

  tile.bydist <- TileScheme(CHMdemo, dimByDist = c(30,40), buffer = 4, removeEmpty = TRUE)

  # Expected size of a the first tile
  expect_identical(rgeos::gArea(tile.bydist$tilePolygons[1,]), 1200)
  expect_identical(rgeos::gArea(tile.bydist$buffPolygons[1,]), 1824)
  expect_identical(rgeos::gArea(tile.bydist$nbuffPolygons[1,]), 1496)

  # Expectecd size of non-overlapping buffer tiles
  expect_equal(rgeos::gArea(tile.bydist$nbuffPolygons[7,]), 1488, tolerance = 0.000001)
  expect_equal(rgeos::gArea(tile.bydist$nbuffPolygons[10,]), 1480, tolerance = 0.000001)
  expect_equal(rgeos::gArea(tile.bydist$nbuffPolygons[12,]), 690.375, tolerance = 0.000001)

  # Expected size of the entire tile set
  expect_equal(rgeos::gArea(tile.bydist$tilePolygons), 12401.38, tolerance = 0.000001)
  expect_equal(rgeos::gArea(tile.bydist$buffPolygons), 19355.38, tolerance = 0.000001)
  expect_equal(rgeos::gArea(tile.bydist$nbuffPolygons), 14419.38, tolerance = 0.000001)

  # Expected number of tiles
  expect_equal(length(tile.bydist$tilePolygons), 12)
  expect_equal(length(tile.bydist$buffPolygons), 12)
  expect_equal(length(tile.bydist$nbuffPolygons), 12)

})

test_that("TileScheme performs as expected using \'dimByDist\' on an Extent object", {

  tile.fromext <- TileScheme(extDemo, dimByDist = c(30,30))

  expect_equal(length(tile.fromext$tilePolygons), 20)
})

