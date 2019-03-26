context("Check MH updaters")

# Poisson(10) distributed data
y <- c(15L, 11L, 8L, 7L, 13L, 4L, 12L, 9L, 6L, 10L, 16L, 11L, 8L,
  18L, 10L, 14L, 9L, 6L, 4L, 9L, 14L, 10L, 5L, 11L, 13L, 6L, 9L,
  16L, 11L, 8L, 8L, 13L, 11L, 11L, 13L, 18L, 12L, 13L, 12L, 7L,
  7L, 13L, 9L, 11L, 14L, 13L, 7L, 13L, 10L, 11L, 11L, 10L, 4L,
  16L, 10L, 9L, 14L, 10L, 8L, 11L, 9L, 15L, 13L, 14L, 12L, 10L,
  12L, 8L, 8L, 5L, 11L, 11L, 12L, 5L, 11L, 8L, 16L, 11L, 9L, 11L,
  9L, 9L, 13L, 11L, 14L, 9L, 6L, 10L, 13L, 8L, 10L, 4L, 5L, 7L,
  4L, 15L, 5L, 14L, 15L, 7L)

test_that("AdaptiveSingleSiteMRW", {

  shape <- DataNode$new(data=1, name='shape')
  rate <- DataNode$new(data=0.1, name='rate')
  lambda <- GammaNode$new(data=1, shape=shape,rate=rate, name='lambda')
  offset <- DataNode$new(data=rep(1, length(y)), name='offset')
  y <- PoissonNode$new(data=y, lambda=lambda, offset=offset, name='y')

  upd <- AdaptiveSingleSiteMRW$new(lambda)

  iter <- 2000
  posterior <- numeric(iter)
  posterior[1] <- lambda$getData()
  for(i in 2:iter) {
    upd$update()
    posterior[i] <- lambda$getData()
  }
  pAlpha <- shape$getData() + sum(y$getData())
  pBeta <- rate$getData() + length(y$getData())
  expect_equal(mean(posterior[200:2000]), pAlpha/pBeta, tolerance=0.04)
  expect_equal(var(posterior[200:2000]), pAlpha/pBeta^2, tolerance=0.03)
})
