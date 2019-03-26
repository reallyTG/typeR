context("04-RapOpts")

test_that("RapUnreliableOpts generator function", {
  # generate objects
  x <- RapUnreliableOpts()
  y <- RapUnreliableOpts(BLM = 0)
  # check defaults are correct
  expect_equal(x@BLM, y@BLM)
})

test_that("update.RapUnreliableOpts", {
  # generate objects
  x <- RapUnreliableOpts()
  y <- update(x, BLM = 30)
  # tests
  expect_equal(y@BLM, 30)
})

test_that("RapReliableOpts generator function", {
  # generate objects
  x <- RapReliableOpts()
  y <- RapReliableOpts(BLM = 0, max.r.level = 5L, failure.multiplier = 1.1)
  # check defaults are correct
  expect_equal(x@BLM, y@BLM)
  expect_equal(x@max.r.level, y@max.r.level)
  expect_equal(x@failure.multiplier, y@failure.multiplier)
})

test_that("update.RapReliableOpts", {
  # generate objects
  x <- RapReliableOpts()
  y <- update(x, BLM = 50, max.r.level = 10L, failure.multiplier = 100)
  # tests
  expect_equal(y@BLM, 50)
  expect_equal(y@max.r.level, 10L)
  expect_equal(y@failure.multiplier, 100)
})
