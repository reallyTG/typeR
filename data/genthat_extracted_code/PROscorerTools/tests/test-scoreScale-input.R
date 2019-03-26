context("scoreScale input testing")

# Add informal tests in "20160823 - Testing scoreScale.R"
#      and in "20161011 - Other Tests.R" (maybe better for PROscorer)

test_that("scoreScale: Errors if not given a df", {
  expect_error(scoreScale(df = as.matrix(mtcars), type = "sum"), "must be a data frame")
  expect_error(scoreScale(df = 1:10, type = "sum"), "must be a data frame")
  expect_error(scoreScale(df = "a", type = "sum"), "must be a data frame")
  expect_silent(scoreScale(df = mtcars, type = "sum"))
})

set.seed(8675309)
dat <- makeFakeData()

test_that("scoreScale: Error if item ranges not in minmax", {
  expect_error(scoreScale(df = dat, type = "mean", minmax = 6))
  expect_error(scoreScale(df = dat, type = "100", minmax = c(1, 4)))
  expect_error(scoreScale(df = dat, type = "100", minmax = c(2, 4)))
  expect_error(scoreScale(df = dat, type = "100", minmax = c(3, 4)))
  expect_error(scoreScale(df = dat, type = "100", minmax = c(0, 3)))
  expect_error(scoreScale(df = dat, type = "100", minmax = c(0, 2)))
  expect_error(scoreScale(df = dat, type = "100", minmax = c(0, 1)))
})

test_that("scoreScale: Silent when item ranges in minmax", {
  expect_silent(scoreScale(df = dat, type = "pomp", minmax = c(0, 4)))
  expect_silent(scoreScale(df = dat, type = "mean", minmax = c(-1, 4)))
  expect_silent(scoreScale(df = dat, type = "100", minmax = c(-100, 4)))
  expect_silent(scoreScale(df = dat, type = "100", minmax = c(0, 5)))
  expect_silent(scoreScale(df = dat, type = "100", minmax = c(0, 10)))
  expect_silent(scoreScale(df = dat, type = "100", minmax = c(0, 100)))
  expect_silent(scoreScale(df = dat, type = "sum"))
})

test_that("scoreScale, revitems: Error if chkstop_revitems fails", {
  expect_error(scoreScale(df = dat, type = "mean", revitems = TRUE), "'minmax'")
  expect_error(scoreScale(df = dat, type = "mean", minmax = c(0, 4),
                          revitems = c(1, 3, 10)),
               "numeric item indexes supplied to 'revitems'")
  expect_error(scoreScale(df = dat, type = "mean", minmax = c(0, 4),
                          revitems = c("q1", "q10")),
               "item names supplied to 'revitems'")
})

## Need to test various combos of CORRECT argument input

test_that("scoreScale: Output is a df", {
  expect_true(is.data.frame(scoreScale(df = mtcars, type = "sum")))
  expect_true(is.data.frame(scoreScale(df = mtcars, type = "sum", keepNvalid = TRUE)))
})
