library("photobiology")
library("photobiologyInOut")
library("lubridate")

context("read FReD CSV file)")

test_that("single spectrum", {

  file.name <- 
    system.file("extdata", "FReDflowerID_157.csv", 
                package = "photobiologyInOut", mustWork = TRUE)
  fred.spct <- read_FReD_csv(file = file.name)
  
  expect_equal(nrow(fred.spct), 401)
  expect_equal(ncol(fred.spct), 3)
  expect_equal(fred.spct[1, "w.length"], 300)
  expect_equal(min(fred.spct), 300)
  expect_equal(fred.spct[401, "w.length"], 700)
  expect_equal(max(fred.spct), 700)
  expect_is(fred.spct[["w.length"]] * 1, "numeric") # numeric or integer or double
  expect_equal(sum(is.na(fred.spct[["w.length"]])), 0)
  expect_true(all(sign(fred.spct[["w.length"]]) > 0))
  expect_is(fred.spct[["Rfr"]], "numeric")
  expect_equal(sum(is.na(fred.spct[["Rfr"]])), 0)
  expect_is(fred.spct, "reflector_spct")
  expect_named(fred.spct, c("flower.id", "w.length", "Rfr"))
  expect_equal(getWhereMeasured(fred.spct), 
               data.frame(lon = NA_real_, lat = NA_real_))
  expect_gt(length(getWhatMeasured(fred.spct)), 0)
  expect_gt(length(comment(fred.spct)), 0)
})

