library("photobiology")
library("photobiologyInOut")
library("lubridate")

context("read LI-1800 PRN file)")

test_that("single spectrum (quantum)", {

  file.name <- 
    system.file("extdata", "spectrum.PRN", 
                package = "photobiologyInOut", mustWork = TRUE)
  licor.spct <- read_licor_prn(file = file.name)
  
  expect_equal(nrow(licor.spct), 601)
  expect_equal(ncol(licor.spct), 2)
  expect_equal(licor.spct[1, 1], 300)
  expect_equal(min(licor.spct), 300)
  expect_equal(licor.spct[601, 1], 900)
  expect_equal(max(licor.spct), 900)
  expect_is(licor.spct[[1]], "numeric")
  expect_equal(sum(is.na(licor.spct[[1]])), 0)
  expect_true(all(sign(licor.spct[[1]]) > 0))
  expect_is(licor.spct[[2]], "numeric")
#  expect_true(all(sign(licor.spct[[1]]) >= 0))
  expect_equal(sum(is.na(licor.spct[[2]])), 0)
  expect_is(licor.spct, "source_spct")
  expect_named(licor.spct, c("w.length", "s.q.irrad"))
  # expect_equal(as.numeric(getWhenMeasured(licor.spct), tz = "UTC"), 
  #              as.numeric(ymd_hms("0000-08-23 14:52:11", tz = "UTC"), tz = "UTC"))
  expect_equal(getWhereMeasured(licor.spct), 
               data.frame(lon = NA_real_, lat = NA_real_))
  expect_gt(length(getWhatMeasured(licor.spct)), 0)
  expect_gt(length(comment(licor.spct)), 0)
  
  file.name <- 
    system.file("extdata", "spectrum-licor-long.PRN", 
                package = "photobiologyInOut", mustWork = TRUE)
  licor.spct <- read_licor_prn(file = file.name)
  
  expect_equal(nrow(licor.spct), 401)
  expect_equal(ncol(licor.spct), 2)
  expect_equal(licor.spct[1, 1], 300)
  expect_equal(min(licor.spct), 300)
  expect_equal(licor.spct[401, 1], 1100)
  expect_equal(max(licor.spct), 1100)
  expect_is(licor.spct[[1]], "numeric")
  expect_equal(sum(is.na(licor.spct[[1]])), 0)
  expect_true(all(sign(licor.spct[[1]]) > 0))
  expect_is(licor.spct[[2]], "numeric")
  
})

test_that("single spectrum Tfr", {
  # for the time being we use a file with reflectance
  file.name <- 
    system.file("extdata", "reflectance.PRN", 
                package = "photobiologyInOut", mustWork = TRUE)
  licor.spct <- read_licor_prn(file = file.name, s.qty = "Tfr")
  
  expect_equal(nrow(licor.spct), 226)
  expect_equal(ncol(licor.spct), 2)
  expect_equal(licor.spct[1, 1], 350)
  expect_equal(min(licor.spct), 350)
  expect_equal(licor.spct[226, 1], 800)
  expect_equal(max(licor.spct), 800)
  expect_is(licor.spct[[1]], "numeric")
  expect_equal(sum(is.na(licor.spct[[1]])), 0)
  expect_true(all(sign(licor.spct[[1]]) > 0))
  expect_is(licor.spct[[2]], "numeric")
  #  expect_true(all(sign(licor.spct[[1]]) >= 0))
  expect_equal(sum(is.na(licor.spct[[2]])), 0)
  expect_is(licor.spct, "filter_spct")
  expect_named(licor.spct, c("w.length", "Tfr"))
  # expect_equal(as.numeric(getWhenMeasured(licor.spct), tz = "UTC"), 
  #              as.numeric(ymd_hms("0000-08-23 14:52:11", tz = "UTC"), tz = "UTC"))
  expect_equal(getWhereMeasured(licor.spct), 
               data.frame(lon = NA_real_, lat = NA_real_))
  expect_gt(length(getWhatMeasured(licor.spct)), 0)
  expect_gt(length(comment(licor.spct)), 0)
  
})

test_that("single spectrum Rfr", {
  
  file.name <- 
    system.file("extdata", "reflectance.PRN", 
                package = "photobiologyInOut", mustWork = TRUE)
  licor.spct <- read_licor_prn(file = file.name, s.qty = "Rfr")
  
  expect_equal(nrow(licor.spct), 226)
  expect_equal(ncol(licor.spct), 2)
  expect_equal(licor.spct[1, 1], 350)
  expect_equal(min(licor.spct), 350)
  expect_equal(licor.spct[226, 1], 800)
  expect_equal(max(licor.spct), 800)
  expect_is(licor.spct[[1]], "numeric")
  expect_equal(sum(is.na(licor.spct[[1]])), 0)
  expect_true(all(sign(licor.spct[[1]]) > 0))
  expect_is(licor.spct[[2]], "numeric")
  #  expect_true(all(sign(licor.spct[[1]]) >= 0))
  expect_equal(sum(is.na(licor.spct[[2]])), 0)
  expect_is(licor.spct, "reflector_spct")
  expect_named(licor.spct, c("w.length", "Rfr"))
  # expect_equal(as.numeric(getWhenMeasured(licor.spct), tz = "UTC"), 
  #              as.numeric(ymd_hms("0000-08-23 14:52:11", tz = "UTC"), tz = "UTC"))
  expect_equal(getWhereMeasured(licor.spct), 
               data.frame(lon = NA_real_, lat = NA_real_))
  expect_gt(length(getWhatMeasured(licor.spct)), 0)
  expect_gt(length(comment(licor.spct)), 0)
  
})

