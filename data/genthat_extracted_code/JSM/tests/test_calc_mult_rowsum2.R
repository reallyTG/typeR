myEps <- .Machine$double.eps


test_that(" simple calc_mult_rowsum2 an A * rowsum( L * M  , v)) are equal ", {

  set.seed(123)
  x <- matrix(runif(20 * 50 * 1000), ncol = 20)
  y <- matrix(runif(20 * 50 * 1000), ncol = 20)
  group <- sort( sample(1 : 500, 50 * 1000, TRUE))
  xmult <- matrix(runif(20 * 500), ncol = 20)
  
  expect_equal(as.vector(xmult * rowsum(x * y, group)), as.vector(calc_mult_rowsum2(v = group, A = xmult, x, y)), tolerance = (10 ^ 2) * myEps, scale = 1)
})


