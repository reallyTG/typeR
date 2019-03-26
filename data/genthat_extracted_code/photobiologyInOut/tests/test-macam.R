library("photobiology")
library("photobiologyInOut")
library("lubridate")

context("read Macam DTA file)")

test_that("single spectrum (quantum)", {

  file.name <- 
    system.file("extdata", "spectrum.DTA", 
                package = "photobiologyInOut", mustWork = TRUE)
  macam.spct <- read_macam_dta(file = file.name,
                               tz = "EET")
  
  expect_equal(nrow(macam.spct), 151)
  expect_equal(ncol(macam.spct), 2)
  expect_equal(macam.spct[1, 1], 250)
  expect_equal(macam.spct[151, 1], 400)
  expect_is(macam.spct[[1]], "numeric")
  expect_equal(sum(is.na(macam.spct[[1]])), 0)
  expect_true(all(sign(macam.spct[[1]]) > 0))
  expect_is(macam.spct[[2]], "numeric")
#  expect_true(all(sign(macam.spct[[1]]) >= 0))
  expect_equal(sum(is.na(macam.spct[[2]])), 0)
  expect_is(macam.spct, "source_spct")
  expect_named(macam.spct, c("w.length", "s.e.irrad"))
  expect_equal(as.numeric(getWhenMeasured(macam.spct), tz = "EET"),
               as.numeric(ymd_hms("1997-05-19 17:44:58", tz = "EET"), tz = "EET"))
  expect_equal(getWhereMeasured(macam.spct), 
               data.frame(lon = NA_real_, lat = NA_real_))
  expect_gt(length(getWhatMeasured(macam.spct)), 0)
  expect_gt(length(comment(macam.spct)), 0)
})

