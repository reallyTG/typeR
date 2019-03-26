testthat::context("circleUnif")

testthat::test_that("it returns required number of points", {
  pts <- circleUnif(n = 10)
  testthat::expect_equal(nrow(pts), 10)
})

testthat::test_that("points are 2d", {
  pts <- circleUnif(n = 10)
  testthat::expect_equal(ncol(pts), 2)
})

testthat::test_that("points are on circle", {
  pts <- circleUnif(n = 4, r = 2.34)
  norms <- apply(pts, MARGIN = 1, FUN = norm, type = "2")
  testthat::expect_equal(norms, rep(2.34, 4))
})
