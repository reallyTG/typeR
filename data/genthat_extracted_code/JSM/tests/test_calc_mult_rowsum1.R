myEps <- .Machine$double.eps


test_that(" simple calc_mult_rowsum1 and A * rowsum( M * u  , v)) are equal ", {

  set.seed(123)
  x <- matrix(runif(20 * 50 * 1000), ncol = 20)
  y <- runif(50 * 1000)
  group <- sort(sample(1 : 500, 50 * 1000, TRUE))
  xmult <- matrix(runif(20 * 500), ncol = 20)
      
  expect_equal( as.vector(xmult * rowsum(x * y, group)), as.vector(calc_mult_rowsum1(v = group, A = xmult, M = x, u = y)), tolerance = (10 ^ 2) * myEps, scale = 1)            
})


