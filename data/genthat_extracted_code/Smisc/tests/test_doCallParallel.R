context("doCallParallel()")

test_that("parallel and non-parallel computations are the same", {

  # Get a vector of x's
  x <- rnorm(18, mean = 2, sd = 2)
     
  # 2 cores
  y1 <- doCallParallel("pnorm", x, mean = 2, sd = 2, njobs = 2)
     
  # 2 cores and randomization
  y2 <- doCallParallel(pnorm, x, mean = 2, sd = 2, njobs = 2, random.seed = 1)
     
  # 1 core
  y3 <- doCallParallel(pnorm, x, mean = 2, sd = 2, njobs = 1)
     
  # Without using doCallParallel()
  y4 <- pnorm(x, mean = 2, sd = 2)
     
  # Comparisons
  expect_equal(y1, y2)
  expect_equal(y1, y3)
  expect_equal(y1, y4)

})
