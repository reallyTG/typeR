context("lfobj to xts conversion")
data("ngaruroro")


test_that("as.xts.lfobj() method work", {
  expect_s3_class(ngaruroro, "lfobj")
  ng <- as.xts(ngaruroro)
  expect_s3_class(ng, "xts")


})

test_that("tyears and find_droughts() handle irregular time series correctly", {

  ngaruroroSummer <- subset(ngaruroro, month %in% 6:8)

  # for extreme value statistics, we allow for irregular time series
  expect_silent(tyears(ngaruroroSummer, dist = "wei", plot = FALSE))

  # deficit statistics require a regular time series
  expect_warning(find_droughts(ngaruroroSummer),
                 "NAs always terminate a drought event.")


})


test_that("creation of lfobj", {
  goodflowData <- data.frame(year=rep(2016, 3),
                             month=rep(7, 3),
                             day=27:29,
                             flow=rep(5, 3))

  #Note that the days are missing the 27th
  gapflowData <- data.frame(year=rep(2016, 3),
                             month=rep(7, 3),
                             day=c(26,28,29),
                             flow=rep(5, 3))


  expect_silent(createlfobj(goodflowData, hyearstart=5))
  expect_warning(createlfobj(gapflowData, hyearstart=5),
                 regexp = "Irregular time series provided. Missing obervations were padded with NAs.")
})



test_that("coercion to lfobj", {
  # coerce zoo object to class lfobj
  z1 <- zoo(1:10, order.by = seq(Sys.Date(), length.out = 10, by = "days"))
  expect_silent(as.lfobj(z1, hyearstart = 5))
  expect_warning(as.lfobj(z1), regexp = "Couldn't determine start of hydrological year from attributes or columns.")
  expect_true(is.lfobj(as.lfobj(z1, hyearstart = 5)))

  # coerce zoo object to class lfobj
  xts1 <- xts(1:10, order.by = seq(Sys.Date(), length.out = 10, by = "days"))
  expect_silent(as.lfobj(xts1, hyearstart = 5))
  expect_warning(as.lfobj(xts1), regexp = "Couldn't determine start of hydrological year from attributes or columns.")
  expect_true(is.lfobj(as.lfobj(xts1, hyearstart = 5)))

  expect_true(is.lfobj(ngaruroro))
})


test_that("readlfdata can read the four file formats", {
  # LFU
  infile <- system.file("samplesheets/oberammergau.dat", package = "lfstat")
  expect_silent(lf <- readlfdata(infile, type = "LFU", hyearstart = 1))
  expect_true(is.lfobj(lf))

  # HZB
  infile <- system.file("samplesheets/kloesterle.dat", package = "lfstat")
  expect_silent(lf <- readlfdata(infile, type = "HZB", hyearstart = 1))
  expect_true(is.lfobj(lf))

  # GRDC
  infile <- system.file("samplesheets/9104020.day", package = "lfstat")
  expect_silent(lf <- readlfdata(infile, type = "GRDC", hyearstart = 1))
  expect_true(is.lfobj(lf))

  # No sample file for TU
})

