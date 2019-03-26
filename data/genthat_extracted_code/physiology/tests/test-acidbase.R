context("acid base")

test_that("Henderson Haselbalch", {
  expect_equal(henderson_hasselbalch(25, 40), 7.4, tolerance = 0.01)
})
