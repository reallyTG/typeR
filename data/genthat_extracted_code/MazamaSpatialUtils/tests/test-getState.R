# -----------------------------------------------------------------------------
testthat::context("getState()")

setup_spatial_data <- function() {
  
  # try to set up spatial data. Skip if fails.  
  spatialDataDir <- try(getSpatialDataDir(), silent = TRUE)
  
  if (!exists('NaturalEarthAdm1')) {
    tryCatch(getSpatialDataDir(), 
             error = function(error) {
               setSpatialDataDir("~/Data/Spatial") 
             })
    tryCatch(loadSpatialData("NaturalEarthAdm1"),
             error = function(error) {
               message("Could not load NaturalEarthAdm1")
             })
  }
  if (!exists("NaturalEarthAdm1")) {
    skip("Could not load NaturalEarthAdm1")
  }
  return (spatialDataDir)
  
}

testthat::test_that("handles errors correctly", {
  
  # Setup
  skip_on_cran()
  spatialDataDir <- setup_spatial_data()
  
  testthat::expect_error(getState())
  testthat::expect_error(getState(),
                         'argument "lon" is missing, with no default')
  testthat::expect_error(getState(0,100))
  testthat::expect_error(getState(-400, 0))
  
  # Setup
  skip_on_cran()
  spatialDataDir <- setup_spatial_data()
  
})

testthat::test_that("returns correct name", {
  
  # Setup
  skip_on_cran()
  spatialDataDir <- setup_spatial_data()
  
  testthat::expect_match(getState(-108, 48), "Montana")
  testthat::expect_match(getState(2.1, 41.38), "Barcelona")
  testthat::expect_match(getState(c(-108, 2.1), c(48, 41.38)), "Montana|Barcelona")
  testthat::expect_equal(getState(1,1), NA_character_)
  
  # Teardown
  if (class(spatialDataDir) == "character") {
    setSpatialDataDir(spatialDataDir)
  } else {
    removeSpatialDataDir()
  }
  
})


testthat::test_that("subsetting with countryCodes works", {
  
  # Setup
  skip_on_cran()
  spatialDataDir <- setup_spatial_data()
  
  testthat::expect_match(getState(2.1, 41.38, countryCodes=c("ES")), "Barcelona")
  testthat::expect_equal(getState(c(2.1, -108), c(41.38, 48), countryCodes="ES"), c("Barcelona", NA_character_))
  
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
  spatialDataDir <- setup_spatial_data()
  
  testthat::expect_s3_class(getState(-114, 32, allData=TRUE), "data.frame")
  testthat::expect_equal(dim(getState(-100, 48, allData=TRUE)), c(1,ncol(NaturalEarthAdm1)))
  testthat::expect_s3_class(getState(c(-80, -90), c(40, 41.38), allData=TRUE), "data.frame")
  testthat::expect_equal(dim(getState(c(-80, -90), c(40, 41.38), allData=TRUE)), c(2,ncol(NaturalEarthAdm1)))
  
  # Teardown
  if (class(spatialDataDir) == "character") {
    setSpatialDataDir(spatialDataDir)
  } else {
    removeSpatialDataDir()
  }
})

