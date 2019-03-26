context("download successful")

test_that("Basic functionality", {
  # only run basic tests on CRAN
  expect_true(inherits(webuse("auto"), "data.frame"), label = "basic download works and data frame returned")
  expect_true("auto" %in% ls(), label = "data frame added to .GlobalEnv")
})

test_that("data frame added to specified environment", {
  skip_on_cran()
  e <- new.env()
  webuse("lifeexp", envir = e)
  expect_true("lifeexp" %in% ls(e), label = "data frame correctly in specified environment")
  expect_true(!"lifeexp" %in% ls(), label = "data frame correctly not in .GlobalEnv")
})

test_that("Version-related tests", {
  skip_on_cran()
  expect_true(inherits(webuse("auto", version = 14), "data.frame"), label = "v14 download works")
  expect_true(inherits(webuse("auto", version = 8), "data.frame"), label = "v8 download works")
})
