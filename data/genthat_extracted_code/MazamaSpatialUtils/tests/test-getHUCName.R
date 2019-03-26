# -----------------------------------------------------------------------------
testthat::context("getHUCName()")


setup_HUCs <- function() {
  
  spatialDataDir <- try(getSpatialDataDir(), silent = TRUE)
  
  if (!exists('WBDHU4_02')) {
    tryCatch(getSpatialDataDir(), 
             error = function(error) {
               setSpatialDataDir("~/Data/Spatial") 
             })
    tryCatch(loadSpatialData("WBDHU4_02"),
             error = function(error) {
               message("Could not load WBDHU4_02")
             })
  }
  if (!exists("WBDHU4_02")) {
    skip("Could not load WBDHU4_02")
  }
  return (spatialDataDir)
  
}

testthat::test_that("handles errors correctly", {
  
  # Setup
  skip_on_cran()
  spatialDataDir <- setup_HUCs()
  
  testthat::expect_error(getHUCName())
  testthat::expect_error(getHUCName(dataset = "WBDHU4_02"),
                         'argument "lon" is missing, with no default')
  testthat::expect_error(getHUCName(0,100, dataset = "WBDHU4_02"))
  testthat::expect_error(getHUCName(-400, 0, dataset = "WBDHU4_02"))
  
  # Setup
  skip_on_cran()
  spatialDataDir <- setup_HUCs()
  
})

testthat::test_that("returns correct name", {
  
  # Setup
  skip_on_cran()
  spatialDataDir <- setup_HUCs()
  
  testthat::expect_match(getHUCName(-114, 32, dataset = "WBDHU4_02"), "Sonora")
  testthat::expect_match(getHUCName(-100, 48, dataset = "WBDHU4_02"), "Red")
  testthat::expect_match(getHUCName(c(-80, -90), c(40, 41), dataset = "WBDHU4_02"), "Monongahela|Lower Illinois")
  testthat::expect_equal(getHUCName(0, 0, dataset = "WBDHU4_02"), NA_character_)
  
  # Teardown
  if (class(spatialDataDir) == "character") {
    setSpatialDataDir(spatialDataDir)
  } else {
    removeSpatialDataDir()
  }
  
})


testthat::test_that("allData returns are correct dimension and type", {
  # Setup
  skip_on_cran()
  spatialDataDir <- setup_HUCs()
  
  testthat::expect_s3_class(getHUCName(-114, 32, dataset = "WBDHU4_02", allData=TRUE), "data.frame")
  testthat::expect_equal(dim(getHUCName(-100, 48, dataset = "WBDHU4_02", allData=TRUE)), c(1,ncol(WBDHU4_02)))
  testthat::expect_s3_class(getHUCName(c(-80, -90), c(40, 41), dataset = "WBDHU4_02", allData=TRUE), "data.frame")
  testthat::expect_equal(dim(getHUCName(c(-80, -90), c(40, 41), dataset = "WBDHU4_02", allData=TRUE)), c(2,ncol(WBDHU4_02)))
  
  # Teardown
  if (class(spatialDataDir) == "character") {
    setSpatialDataDir(spatialDataDir)
  } else {
    removeSpatialDataDir()
  }
})

