
myEps <- .Machine$double.eps


test_that(" simple calc_rowsum_mult and rowsum are equal ", {

  set.seed(123)
  x <- matrix(runif(20 * 50 * 1000), ncol = 20)
  group <- sort(sample(1 : 500, 50 * 1000, TRUE))
  xmult <- runif(50 * 1000);

  expect_equal(as.vector(rowsum(x * xmult, group)), as.vector(calc_rowsum_mult(v = group, M = x, u = xmult)), tolerance = (10 ^ 2) * myEps, scale = 1)

})

