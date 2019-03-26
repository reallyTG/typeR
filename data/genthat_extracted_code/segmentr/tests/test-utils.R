context("utils")
require(foreach)

test_that("interleave merges two or more vectors in a list", {
  data <- list(c(1, 3, 5), c(2, 4))
  points <- interleave(data)
  expect_equal(points, c(1, 2, 3, 4, 5))


  data <- list(c(1, 4, 7, 0), c(2, 5, 8), c(3, 6, 9))
  points <- interleave(data)
  expect_equal(points, c(1, 2, 3, 4, 5, 6, 7, 8, 9, 0))

  data <- list(c(1, 4, 7, 0))
  points <- interleave(data)
  expect_equal(points, c(1, 4, 7, 0))
})

test_that("chunk splits vectors into several lists", {
  points <- chunk(1:8, 2)
  expected <- list(c(1, 3, 5, 7), c(2, 4, 6, 8))

  foreach(p = points, e = expected) %do% {
    expect_equal(p, e)
  }
})
