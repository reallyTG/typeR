context("Unit detection and conversion")

test_that("flowunit() methods for lfobj and xts exist", {
  data("ngaruroro")
  ng <- as.xts(ngaruroro)

  expect_equal(flowunit(ngaruroro), "m^3/s")
  expect_equal(flowunit(ng), "m^3/s")
})

test_that("units for lfobj and xts objects can be modified", {
  data("ngaruroro")
  ng <- as.xts(ngaruroro)

  flowunit(ngaruroro) <- "l/s"
  flowunit(ng) <- "cm^3/h"

  expect_equal(flowunit(ngaruroro), "l/s")
  expect_equal(flowunit(ng), "cm^3/h")
})

test_that("make sure, parsed units are present in xts objects", {
  data("ngaruroro")
  ng <- as.xts(ngaruroro)

  expect_equal(xtsAttributes(ng)[["unit.parsed"]],
               c(volume = "m", time = "secs"))

  flowunit(ng) <- "cm^3/h"

  expect_equal(xtsAttributes(ng)[["unit.parsed"]],
               c(volume = "cm", time = "hours"))
})



test_that("unsupported units raise an error", {
  data("ngaruroro")

  expect_error(flowunit(ngaruroro) <- "t/s")
})


test_that(".split_unit returns a named output", {
  expect_equal(names(.split_unit("m^3/h")), c("volume", "time"))
})


test_that(".split_unit accepts abbreviations", {
  expect_equal(unname(.split_unit("met^3/hou")),
               c("m", "hours"))

  expect_equal(unname(.split_unit("l/s")),
               c("l", "secs"))

  expect_equal(unname(.split_unit("cm^3/hou")),
               c("cm", "hours"))

  expect_equal(unname(.split_unit("centi/hou")),
               c("cm", "hours"))
})


test_that("default units are used", {
  ng2 <- head(ngaruroro)
  attr <- attr(ng2, "lfobj")

  # strip unit
  attr(ng2, "lfobj") <- attr[setdiff(names(attr), "unit")]

  expect_warning(as.xts(ng2),
                 regexp = "No unit found in attributes, assuming ")
})








