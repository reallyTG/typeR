library("photobiology")
library("photobiologyInOut")
library("lubridate")

context("read ASTER txt file)")

test_that("single spectrum", {

  file.name <- 
    system.file("extdata", "drygrass-spectrum.txt", 
                package = "photobiologyInOut", mustWork = TRUE)
  fred.spct <- read_ASTER_txt(file = file.name)
  
  expect_equal(nrow(fred.spct), 2559)
  expect_equal(ncol(fred.spct), 2)
  expect_equal(fred.spct[1, 1], 380.49)
  expect_equal(min(fred.spct), 380.49)
  expect_equal(fred.spct[2559, 1], 14011)
  expect_equal(max(fred.spct), 14011)
  expect_is(fred.spct[[1]], "numeric")
  expect_equal(sum(is.na(fred.spct[[1]])), 0)
  expect_true(all(sign(fred.spct[[1]]) > 0))
  expect_is(fred.spct[[2]], "numeric")
  expect_equal(sum(is.na(fred.spct[[2]])), 0)
  expect_is(fred.spct, "reflector_spct")
  expect_named(fred.spct, c("w.length", "Rfr"))
  expect_equal(getWhereMeasured(fred.spct), 
               data.frame(lon = NA_real_, lat = NA_real_))
  expect_gt(length(getWhatMeasured(fred.spct)), 0)
  expect_gt(length(comment(fred.spct)), 0)
})

