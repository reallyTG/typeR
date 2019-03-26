# -----------------------------------------------------------------------------
testthat::context("getHUC()")


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
  
  testthat::expect_error(getHUC())
  testthat::expect_error(getHUC(dataset = "WBDHU4_02"),
                         'argument "lon" is missing, with no default')
  testthat::expect_error(getHUC(0,100, dataset = "WBDHU4_02"))
  testthat::expect_error(getHUC(-400, 0, dataset = "WBDHU4_02"))
  
  # Setup
  skip_on_cran()
  spatialDataDir <- setup_HUCs()
  
})

testthat::test_that("returns correct name", {
  
  # Setup
  skip_on_cran()
  spatialDataDir <- setup_HUCs()
  
  testthat::expect_match(getHUC(-114, 32, dataset = "WBDHU4_02"), "1508")
  testthat::expect_match(getHUC(-100, 48, dataset = "WBDHU4_02"), "0902")
  testthat::expect_match(getHUC(c(-80, -90), c(40, 41), dataset = "WBDHU4_02"), "0502|0713")
  testthat::expect_equal(getHUC(0, 0, dataset = "WBDHU4_02"), NA_character_)
  
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
  
  testthat::expect_s3_class(getHUC(-114, 32, dataset = "WBDHU4_02", allData=TRUE), "data.frame")
  testthat::expect_equal(dim(getHUC(-100, 48, dataset = "WBDHU4_02", allData=TRUE)), c(1,ncol(WBDHU4_02)))
  testthat::expect_s3_class(getHUC(c(-80, -90), c(40, 41), dataset = "WBDHU4_02", allData=TRUE), "data.frame")
  testthat::expect_equal(dim(getHUC(c(-80, -90), c(40, 41), dataset = "WBDHU4_02", allData=TRUE)), c(2,ncol(WBDHU4_02)))
  
  # Teardown
  if (class(spatialDataDir) == "character") {
    setSpatialDataDir(spatialDataDir)
  } else {
    removeSpatialDataDir()
  }
})

