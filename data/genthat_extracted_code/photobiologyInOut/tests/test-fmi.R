library("photobiology")
library("photobiologyInOut")
library("lubridate")

context("read FMI (Anders)")

test_that("single cumulated spectrum file", {

  file.name <- 
    system.file("extdata", "2014-08-21_cum.hel", 
                package = "photobiologyInOut", mustWork = TRUE)
  fmi.spct <- read_fmi_cum(file = file.name)
  
  expect_equal(nrow(fmi.spct), 511)
  expect_equal(ncol(fmi.spct), 2)
  expect_equal(fmi.spct[1, 1], 290)
  expect_equal(fmi.spct[511, 1], 800)
  expect_equal(signif(fmi.spct[1, 2], 7), 0)
  expect_equal(signif(fmi.spct[200, 2], 7), 24704.90)
  expect_equal(signif(fmi.spct[511, 2], 7), 15788.29)
  expect_is(fmi.spct[[1]], "numeric")
  expect_equal(sum(is.na(fmi.spct[[1]])), 0)
  expect_true(all(sign(fmi.spct[[1]]) > 0))
  expect_is(fmi.spct[[2]], "numeric")
  expect_true(all(sign(fmi.spct[[1]]) >= 0))
  expect_equal(sum(is.na(fmi.spct[[2]])), 0)
  expect_is(fmi.spct, "source_spct")
  expect_named(fmi.spct, c("w.length", "s.e.irrad"))
  expect_equal(getWhenMeasured(fmi.spct), 
               ymd_hms("2014-08-21 00:00:00", tz = "UTC"))
  expect_equal(length(comment(fmi.spct)), 0)
})

test_that("single cumulated garbage", {
  
  file.name <- 
    system.file("extdata", "garbage.txt", 
                package = "photobiologyInOut", mustWork = TRUE)
  expect_warning(empty.spct <- read_fmi_cum(file = file.name))
  
  expect_equal(nrow(empty.spct), 0)
  expect_equal(ncol(empty.spct), 2)
  expect_is(empty.spct[[1]], "numeric")
  expect_is(empty.spct[[2]], "numeric")
  expect_is(empty.spct, "source_spct")
  expect_named(empty.spct, c("w.length", "s.e.irrad"))
  expect_equal(getWhenMeasured(empty.spct), 
               ymd_hms(NA_character_, tz = "UTC"))
  expect_equal(length(comment(empty.spct)), 0)
})

test_that("multiple multiple cummulated spectrum files", {
  
  my.files <- 
    system.file("extdata", c("2014-08-21_cum.hel", "2014-08-22_cum.hel"), 
                package = "photobiologyInOut", mustWork = TRUE)
  fmi.mspct <- read_m_fmi_cum(files = my.files)
  
  expect_is(fmi.mspct, "source_mspct")
  expect_equal(length(fmi.mspct), 2)
  expect_equal(dim(fmi.mspct), c(2, 1))
  expect_false(attr(fmi.mspct, "mspct.byrow", exact = TRUE))
  expect_named(fmi.mspct, c( "2014_08_21_cum.hel", "2014_08_22_cum.hel"))
  expect_equal(nrow(fmi.mspct[[1]]), 511)
  expect_equal(ncol(fmi.mspct[[1]]), 2)
  expect_equal(fmi.mspct[[1]][1, 1], 290)
  expect_equal(fmi.mspct[[1]][511, 1], 800)
  expect_is(fmi.mspct[[1]][[1]], "numeric")
  expect_equal(sum(is.na(fmi.mspct[[1]][[1]])), 0)
  expect_true(all(sign(fmi.mspct[[1]][[1]]) > 0))
  expect_is(fmi.mspct[[1]][[2]], "numeric")
  expect_true(all(sign(fmi.mspct[[1]][[1]]) >= 0))
  expect_equal(sum(is.na(fmi.mspct[[1]][[2]])), 0)
  expect_is(fmi.mspct[[1]], "source_spct")
  expect_named(fmi.mspct[[1]], c("w.length", "s.e.irrad"))
  expect_equal(getWhenMeasured(fmi.mspct[[1]]), 
               as.POSIXct(ymd("2014-08-21", tz = "UTC")))
  expect_equal(length(comment(fmi.mspct[[1]])), 0)
})

test_that("spectral irradiance", {
  
  my.file <- 
    system.file("extdata", "2013-05-01.hel", 
                package = "photobiologyInOut", mustWork = TRUE)
  fmi.mspct <- read_fmi2mspct(file = my.file)
  
  expect_is(fmi.mspct, "source_mspct")
  expect_equal(length(fmi.mspct), 15)
  expect_equal(dim(fmi.mspct), c(15, 1))
  expect_false(attr(fmi.mspct, "mspct.byrow", exact = TRUE))
  expect_named(fmi.mspct, 
               c( "20130501 3:30:00",  "20130501 4:30:00",  "20130501 5:30:00",
                  "20130501 6:30:00",  "20130501 7:30:00",  "20130501 8:30:00",
                  "20130501 9:30:00",  "20130501 10:30:00", "20130501 11:30:00",
                  "20130501 12:30:00", "20130501 13:30:00", "20130501 14:30:00",
                  "20130501 15:30:00", "20130501 16:30:00", "20130501 17:30:00"))
  expect_equal(nrow(fmi.mspct[[1]]), 561)
  expect_equal(ncol(fmi.mspct[[1]]), 2)
  expect_equal(fmi.mspct[[1]][1, 1], 290)
  expect_equal(fmi.mspct[[1]][561, 1], 850)
  expect_equal(signif(fmi.mspct[[1]][1, 2], 7), 0)
  expect_equal(signif(fmi.mspct[[1]][250, 2], 7), 0.126231)
  expect_equal(signif(fmi.mspct[[1]][561, 2], 7), 0.09018384)
  expect_is(fmi.mspct[[1]][[1]], "numeric")
  expect_equal(sum(is.na(fmi.mspct[[1]][[1]])), 0)
  expect_true(all(sign(fmi.mspct[[1]][[1]]) > 0))
  expect_is(fmi.mspct[[1]][[2]], "numeric")
  expect_true(all(sign(fmi.mspct[[1]][[1]]) >= 0))
  expect_equal(sum(is.na(fmi.mspct[[1]][[2]])), 0)
  expect_is(fmi.mspct[[1]], "source_spct")
  expect_named(fmi.mspct[[1]], c("w.length", "s.e.irrad"))
  expect_equal(getWhenMeasured(fmi.mspct[[1]]), 
               as.POSIXct(ymd_hms("2013-05-01 03:30:00", tz = "UTC")))
  expect_equal(length(comment(fmi.mspct[[1]])), 0)
})

test_that("spectral irradiance garbage", {
  
  file.name <- 
    system.file("extdata", "garbage.txt", 
                package = "photobiologyInOut", mustWork = TRUE)
  expect_warning(empty.mspct <- read_fmi2mspct(file = file.name))
  
  expect_is(empty.mspct, "source_mspct")
  expect_equal(length(empty.mspct), 0)
  expect_equal(dim(empty.mspct), c(0, 1))
  expect_false(attr(empty.mspct, "mspct.byrow", exact = TRUE))
})

