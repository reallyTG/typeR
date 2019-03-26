library("photobiology")
library("photobiologyInOut")
library("lubridate")
library("readr")

context("read Ocean Optics")

test_that("jaz", {

  file.name <- 
    system.file("extdata", "spectrum.JazIrrad", 
                package = "photobiologyInOut", mustWork = TRUE)
  # warnings triggered by negative irradiance values in file
  suppressWarnings(jaz.spct <- 
                     read_oo_jazirrad(file = file.name,
                                      tz = "EET"))
  
  expect_equal(nrow(jaz.spct), 2048)
  expect_equal(ncol(jaz.spct), 2)
  expect_equal(jaz.spct[1, 1], 188.8252, tolerance = 0.0001)
  expect_equal(jaz.spct[2048, 1], 1033.148, tolerance = 0.0001)
  expect_is(jaz.spct[[1]], "numeric")
  expect_equal(sum(is.na(jaz.spct[[1]])), 0)
  expect_true(all(sign(jaz.spct[[1]]) > 0))
  expect_is(jaz.spct[[2]], "numeric")
  expect_equal(sum(is.na(jaz.spct[[2]])), 0)
  expect_is(jaz.spct, "source_spct")
  expect_named(jaz.spct, c("w.length", "s.e.irrad"))
  expect_equal(as.numeric(getWhenMeasured(jaz.spct), tz = "EET"),
               as.numeric(ymd_hms("2015-02-03 09:44:41", tz = "EET"), tz = "EET"))
  expect_equal(getWhereMeasured(jaz.spct), 
               data.frame(lon = NA_real_, lat = NA_real_))
  expect_equal(getWhatMeasured(jaz.spct), "File: spectrum.JazIrrad")
  expect_equal(getTimeUnit(jaz.spct), "second")
  expect_gt(length(comment(jaz.spct)), 0)

  
  # warnings triggered by negative irradiance values in file
  suppressWarnings(jaz.spct <- 
                     read_oo_jazirrad(file = file.name,
                                      date = ymd_hms("2016-01-01 00:00:01", tz = "EET")))
  
  expect_equal(nrow(jaz.spct), 2048)
  expect_equal(ncol(jaz.spct), 2)
  expect_equal(jaz.spct[1, 1], 188.8252, tolerance = 0.0001)
  expect_equal(jaz.spct[2048, 1], 1033.148, tolerance = 0.0001)
  expect_is(jaz.spct[[1]], "numeric")
  expect_equal(sum(is.na(jaz.spct[[1]])), 0)
  expect_true(all(sign(jaz.spct[[1]]) > 0))
  expect_is(jaz.spct[[2]], "numeric")
  expect_equal(sum(is.na(jaz.spct[[2]])), 0)
  expect_is(jaz.spct, "source_spct")
  expect_named(jaz.spct, c("w.length", "s.e.irrad"))
  expect_equal(as.numeric(getWhenMeasured(jaz.spct), tz = "EET"),
               as.numeric(ymd_hms("2016-01-01 00:00:01", tz = "EET"), tz = "EET"))
  expect_equal(getWhereMeasured(jaz.spct), 
               data.frame(lon = NA_real_, lat = NA_real_))
  expect_equal(getWhatMeasured(jaz.spct), "File: spectrum.JazIrrad")
  expect_equal(getTimeUnit(jaz.spct), "second")
  expect_gt(length(comment(jaz.spct)), 0)

})

test_that("jaz_Tpc", {
  
  file.name <- 
    system.file("extdata", "reflectance.jaz", 
                package = "photobiologyInOut", mustWork = TRUE)
  # warnings triggered by negative irradiance values in file
  suppressWarnings(jaz.spct <- 
                     read_oo_jazpc(file = file.name,
                                   qty.in = "Rpc",
                                      tz = "EET"))
  
  expect_equal(nrow(jaz.spct), 2048)
  expect_equal(ncol(jaz.spct), 2)
  expect_equal(jaz.spct[1, 1], 190.3139, tolerance = 0.0001)
  expect_equal(jaz.spct[2048, 1], 892.6115, tolerance = 0.0001)
  expect_is(jaz.spct[[1]], "numeric")
  expect_equal(sum(is.na(jaz.spct[[1]])), 0)
  expect_true(all(sign(jaz.spct[[1]]) > 0))
  expect_is(jaz.spct[[2]], "numeric")
  expect_equal(sum(is.na(jaz.spct[[2]])), 0)
  expect_is(jaz.spct, "reflector_spct")
  expect_named(jaz.spct, c("w.length", "Rfr"))
  expect_equal(as.numeric(getWhenMeasured(jaz.spct), tz = "EET"),
               as.numeric(ymd_hms("2018-09-17 14:58:29", tz = "EET"), tz = "EET"))
  expect_equal(getWhereMeasured(jaz.spct), 
               data.frame(lon = NA_real_, lat = NA_real_))
  expect_equal(getWhatMeasured(jaz.spct), "File: reflectance.jaz")
  expect_equal(getTimeUnit(jaz.spct), "unknown")
  expect_gt(length(comment(jaz.spct)), 0)

})

test_that("jaz_Rpc", {
  
  file.name <- 
    system.file("extdata", "reflectance.jaz", 
                package = "photobiologyInOut", mustWork = TRUE)
  # warnings triggered by negative irradiance values in file
  suppressWarnings(jaz.spct <- 
                     read_oo_jazpc(file = file.name,
                                   tz = "EET"))
  
  expect_equal(nrow(jaz.spct), 2048)
  expect_equal(ncol(jaz.spct), 2)
  expect_equal(jaz.spct[1, 1], 190.3139, tolerance = 0.0001)
  expect_equal(jaz.spct[2048, 1], 892.6115, tolerance = 0.0001)
  expect_is(jaz.spct[[1]], "numeric")
  expect_equal(sum(is.na(jaz.spct[[1]])), 0)
  expect_true(all(sign(jaz.spct[[1]]) > 0))
  expect_is(jaz.spct[[2]], "numeric")
  expect_equal(sum(is.na(jaz.spct[[2]])), 0)
  expect_is(jaz.spct, "filter_spct")
  expect_named(jaz.spct, c("w.length", "Tfr"))
  expect_equal(as.numeric(getWhenMeasured(jaz.spct), tz = "EET"),
               as.numeric(ymd_hms("2018-09-17 14:58:29", tz = "EET"), tz = "EET"))
  expect_equal(getWhereMeasured(jaz.spct), 
               data.frame(lon = NA_real_, lat = NA_real_))
  expect_equal(getWhatMeasured(jaz.spct), "File: reflectance.jaz")
  expect_equal(getTimeUnit(jaz.spct), "unknown")
  expect_gt(length(comment(jaz.spct)), 0)
  
})


test_that("jaz_raw", {
  
  file.name <- 
    system.file("extdata", "spectrum.jaz", 
                package = "photobiologyInOut", mustWork = TRUE)

  jaz.spct <- read_oo_jazdata(file = file.name, 
                              tz = "EET")
  
  expect_equal(nrow(jaz.spct), 2048)
  expect_equal(ncol(jaz.spct), 2)
  expect_equal(jaz.spct[1, 1], 190.313904, tolerance = 0.000001)
  expect_equal(jaz.spct[2048, 1], 892.611511, tolerance = 0.000001)
  expect_is(jaz.spct[[1]], "numeric")
  expect_equal(sum(is.na(jaz.spct[[1]])), 0)
  expect_true(all(sign(jaz.spct[[1]]) > 0))
  expect_is(jaz.spct[[2]], "numeric")
  expect_equal(sum(is.na(jaz.spct[[2]])), 0)
  expect_is(jaz.spct, "raw_spct")
  expect_named(jaz.spct, c("w.length", "counts"))
  expect_equal(as.numeric(getWhenMeasured(jaz.spct), tz = "EET"),
               as.numeric(ymd_hms("2016-04-25 12:49:02", tz = "EET"), tz = "EET"))
  expect_equal(getWhereMeasured(jaz.spct), 
               data.frame(lon = NA_real_, lat = NA_real_))
  expect_equal(getWhatMeasured(jaz.spct), "File: spectrum.jaz")
  expect_gt(length(comment(jaz.spct)), 0)
  
  jaz.spct <- read_oo_jazdata(file = file.name,
                              date = ymd_hms("2016-01-01 00:00:01", tz = "EET"))
  
  expect_equal(nrow(jaz.spct), 2048)
  expect_equal(ncol(jaz.spct), 2)
  expect_equal(jaz.spct[1, 1], 190.313904, tolerance = 0.000001)
  expect_equal(jaz.spct[2048, 1], 892.611511, tolerance = 0.000001)
  expect_is(jaz.spct[[1]], "numeric")
  expect_equal(sum(is.na(jaz.spct[[1]])), 0)
  expect_true(all(sign(jaz.spct[[1]]) > 0))
  expect_is(jaz.spct[[2]], "numeric")
  expect_equal(sum(is.na(jaz.spct[[2]])), 0)
  expect_is(jaz.spct, "raw_spct")
  expect_named(jaz.spct, c("w.length", "counts"))
  expect_equal(as.numeric(getWhenMeasured(jaz.spct), tz = "EET"),
               as.numeric(ymd_hms("2016-01-01 00:00:01", tz = "EET"), tz = "EET"))
  expect_equal(getWhereMeasured(jaz.spct), 
               data.frame(lon = NA_real_, lat = NA_real_))
  expect_equal(getWhatMeasured(jaz.spct), "File: spectrum.jaz")
  expect_gt(length(comment(jaz.spct)), 0)
  
})


test_that("SpectraSuite", {
  
  file.name <- 
    system.file("extdata", "spectrum.SSIrrad", 
                package = "photobiologyInOut", mustWork = TRUE)
  ss.spct <- read_oo_ssirrad(file = file.name, 
                             tz = "CET")
  
  expect_equal(nrow(ss.spct), 1044)
  expect_equal(ncol(ss.spct), 2)
  expect_equal(ss.spct[1, 1], 199.08)
  expect_equal(ss.spct[1044, 1], 998.61)
  expect_is(ss.spct[[1]], "numeric")
  expect_equal(sum(is.na(ss.spct[[1]])), 0)
  expect_true(all(sign(ss.spct[[1]]) > 0))
  expect_is(ss.spct[[2]], "numeric")
  expect_equal(sum(is.na(ss.spct[[2]])), 0)
  expect_is(ss.spct, "source_spct")
  expect_named(ss.spct, c("w.length", "s.e.irrad"))
  expect_equal(as.numeric(getWhenMeasured(ss.spct), tz = "CET"),
               as.numeric(ymd_hms("2013-05-06 15:13:40", tz = "CET"), tz = "CET"))
  expect_equal(getWhereMeasured(ss.spct), 
               data.frame(lon = NA_real_, lat = NA_real_))
  expect_equal(getWhatMeasured(ss.spct), "File: spectrum.SSIrrad")
  expect_equal(getTimeUnit(ss.spct), "second")
  expect_gt(length(comment(ss.spct)), 0)
})

test_that("jazz-comma", {
  
  file.name <- 
    system.file("extdata", "spectrum-comma.JazIrrad", 
                package = "photobiologyInOut", mustWork = TRUE)
  my.locale <- readr::locale("en", decimal_mark = ",", 
                             tz = "EET")
  # warnings triggered by negative irradiance values in file
  suppressWarnings(jaz.spct <- 
                     read_oo_jazirrad(file = file.name, 
                                      locale = my.locale))
  
  expect_equal(nrow(jaz.spct), 2048)
  expect_equal(ncol(jaz.spct), 2)
  expect_equal(jaz.spct[1, 1], 188.8252, tolerance = 0.0001)
  expect_equal(jaz.spct[2048, 1], 1033.148, tolerance = 0.0001)
  expect_is(jaz.spct[[1]], "numeric")
  expect_equal(sum(is.na(jaz.spct[[1]])), 0)
  expect_true(all(sign(jaz.spct[[1]]) > 0))
  expect_is(jaz.spct[[2]], "numeric")
  expect_equal(sum(is.na(jaz.spct[[2]])), 0)
  expect_is(jaz.spct, "source_spct")
  expect_named(jaz.spct, c("w.length", "s.e.irrad"))
  expect_equal(as.numeric(getWhenMeasured(jaz.spct), tz = "EET"),
               as.numeric(ymd_hms("2015-02-03 09:44:41", tz = "EET"), tz = "EET"))
  expect_equal(getWhereMeasured(jaz.spct), 
               data.frame(lon = NA_real_, lat = NA_real_))
  expect_equal(getWhatMeasured(jaz.spct), "File: spectrum-comma.JazIrrad")
  expect_equal(getTimeUnit(jaz.spct), "second")
  expect_gt(length(comment(jaz.spct)), 0)
})

test_that("jazz_raw-comma", {
  
  file.name <- 
    system.file("extdata", "spectrum-comma.jaz", 
                package = "photobiologyInOut", mustWork = TRUE)
  my.locale <- readr::locale("en", decimal_mark = ",", tz = "EET")
  jaz.spct <- read_oo_jazdata(file = file.name, 
                              locale = my.locale)
  
  expect_equal(nrow(jaz.spct), 2048)
  expect_equal(ncol(jaz.spct), 2)
  expect_equal(jaz.spct[1, 1], 190.313904, tolerance = 0.000001)
  expect_equal(jaz.spct[2048, 1], 892.611511, tolerance = 0.000001)
  expect_is(jaz.spct[[1]], "numeric")
  expect_equal(sum(is.na(jaz.spct[[1]])), 0)
  expect_true(all(sign(jaz.spct[[1]]) > 0))
  expect_is(jaz.spct[[2]], "numeric")
  expect_equal(sum(is.na(jaz.spct[[2]])), 0)
  expect_is(jaz.spct, "raw_spct")
  expect_named(jaz.spct, c("w.length", "counts"))
  expect_equal(as.numeric(getWhenMeasured(jaz.spct), tz = "EET"),
               as.numeric(ymd_hms("2016-04-25 12:49:02", tz = "EET"), tz = "EET"))
  expect_equal(getWhereMeasured(jaz.spct), 
               data.frame(lon = NA_real_, lat = NA_real_))
  expect_equal(getWhatMeasured(jaz.spct), "File: spectrum-comma.jaz")
  expect_gt(length(comment(jaz.spct)), 0)
})


test_that("SpectraSuite-comma", {
  
  file.name <- 
    system.file("extdata", "spectrum-comma.SSIrrad", 
                package = "photobiologyInOut", mustWork = TRUE)
  my.locale <- readr::locale("en", decimal_mark = ",", tz = "CET")

  ss.spct <- read_oo_ssirrad(file = file.name, 
                             locale = my.locale)
  
  expect_equal(nrow(ss.spct), 1044)
  expect_equal(ncol(ss.spct), 2)
  expect_equal(ss.spct[1, 1], 199.08)
  expect_equal(ss.spct[1044, 1], 998.61)
  expect_is(ss.spct[[1]], "numeric")
  expect_equal(sum(is.na(ss.spct[[1]])), 0)
  expect_true(all(sign(ss.spct[[1]]) > 0))
  expect_is(ss.spct[[2]], "numeric")
  expect_equal(sum(is.na(ss.spct[[2]])), 0)
  expect_is(ss.spct, "source_spct")
  expect_named(ss.spct, c("w.length", "s.e.irrad"))
  expect_equal(as.numeric(getWhenMeasured(ss.spct), tz = "CET"), 
               as.numeric(ymd_hms("2013-05-06 15:13:40", tz = "CET"), tz = "CET"))
  expect_equal(getWhereMeasured(ss.spct), 
               data.frame(lon = NA_real_, lat = NA_real_))
  expect_equal(getWhatMeasured(ss.spct), "File: spectrum-comma.SSIrrad")
  expect_equal(getTimeUnit(ss.spct), "second")
  expect_gt(length(comment(ss.spct)), 0)
})

test_that("pi_raw", {
  
  file.name <- 
    system.file("extdata", "spectrum.pi", 
                package = "photobiologyInOut", mustWork = TRUE)
  my.date <- now(tzone = "EET")
  pi.spct <- read_oo_pidata(file = file.name, 
                            date = my.date,
                            npixels = 2048)
  
  expect_equal(nrow(pi.spct), 2048)
  expect_equal(ncol(pi.spct), 2)
  expect_equal(pi.spct[1, 1], 188.41408000, tolerance = 0.000001)
  expect_equal(pi.spct[2048, 1], 1035.61297366, tolerance = 0.000001)
  expect_is(pi.spct[[1]], "numeric")
  expect_equal(sum(is.na(pi.spct[[1]])), 0)
  expect_true(all(sign(pi.spct[[1]]) > 0))
  expect_is(pi.spct[[2]], "numeric")
  expect_equal(sum(is.na(pi.spct[[2]])), 0)
  expect_is(pi.spct, "raw_spct")
  expect_named(pi.spct, c("w.length", "counts"))
  expect_equal(as.numeric(getWhenMeasured(pi.spct), tz = "EET"),
               as.numeric(my.date, tz = "EET"))
  expect_equal(getWhereMeasured(pi.spct), 
               data.frame(lon = NA_real_, lat = NA_real_))
  expect_equal(getWhatMeasured(pi.spct), "File: spectrum.pi")
  expect_gt(length(comment(pi.spct)), 0)

  file.name <- 
    system.file("extdata", "spectrum-seq-dark.pi", 
                package = "photobiologyInOut", mustWork = TRUE)
  my.date <- now(tzone = "EET")
  pi.spct <- read_oo_pidata(file = file.name, 
                            date = my.date,
                            npixels = 2048)
  
  expect_equal(nrow(pi.spct), 2048)
  expect_equal(ncol(pi.spct), 2)
  expect_equal(pi.spct[1, 1], 188.41408000, tolerance = 0.000001)
  expect_equal(pi.spct[2048, 1], 1035.61297366, tolerance = 0.000001)
  expect_is(pi.spct[[1]], "numeric")
  expect_equal(sum(is.na(pi.spct[[1]])), 0)
  expect_true(all(sign(pi.spct[[1]]) > 0))
  expect_is(pi.spct[[2]], "numeric")
  expect_equal(sum(is.na(pi.spct[[2]])), 0)
  expect_is(pi.spct, "raw_spct")
  expect_named(pi.spct, c("w.length", "counts"))
  expect_equal(as.numeric(getWhenMeasured(pi.spct), tz = "EET"),
               as.numeric(my.date, tz = "EET"))
  expect_equal(getWhereMeasured(pi.spct), 
               data.frame(lon = NA_real_, lat = NA_real_))
  expect_equal(getWhatMeasured(pi.spct), "File: spectrum-seq-dark.pi")
  expect_gt(length(comment(pi.spct)), 0)
})
