context("Output files management")

dir <- tempdir()
setwd(dir)

if (dir.exists("project-test")) unlink("project-test", recursive = TRUE)
dir.create("project-test")
setwd("project-test")

prInit()

test_that("prWriteTable works", {
  assign("data", data.frame(x = 1:10, y = rnorm(10)), envir = .GlobalEnv)
  expect_silent(prWriteTable("data"))
  expect_true(file.exists("output/data.txt"))
  expect_false(file.size("output/data.txt") == 0)
})

test_that("prWriteTable does not overwrite existing files", {
  assign("data", data.frame(x = 1:10, y = rnorm(10)), envir = .GlobalEnv)
  expect_error(prWriteTable("data"))
})

test_that("prWriteTable can write in folders", {
  assign("data", data.frame(x = 1:10, y = rnorm(10)), envir = .GlobalEnv)
  expect_silent(prWriteTable("dir1/data"))
  expect_true(file.exists("output/dir1/data.txt"))
  expect_false(file.size("output/dir1/data.txt") == 0)
})

