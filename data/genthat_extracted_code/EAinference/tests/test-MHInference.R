
context("MHInference")
#-------------------
# postInference.MHLS
#-------------------
set.seed(123)
n <- 5
p <- 10
X <- matrix(rnorm(n*p),n)
Y <- X %*% rep(1,p) + rnorm(n)
sig2 <- 1
lbd <- .37
weights <- rep(1,p)
group <- 1:p
parallel <- (.Platform$OS.type != "windows")

test_that("High dimensional setting", {
  expect_error(postInference.MHLS(X=X, Y=Y, lbd=lbd, weights = weights,
                                  sig2.hat=1, alpha=.05, nChain=3, niterPerChain=20,
                                  method = "coeff", parallel = parallel)
               , NA)
  expect_error(postInference.MHLS(X=X, Y=Y, lbd=lbd, weights = -weights,
                                  sig2.hat=1, alpha=.05, nChain=3, niterPerChain=20,
                                  method = "coeff", parallel = parallel)
               , "positive")
  expect_error(postInference.MHLS(X=X, Y=c(Y,0), lbd=lbd, weights = weights,
                                  sig2.hat=1, alpha=.05, nChain=3, niterPerChain=20,
                                  method = "coeff", parallel = parallel)
               , "dimension")
  expect_error(postInference.MHLS(X=X[-1,], Y=Y, lbd=lbd, weights = weights,
                                  sig2.hat=1, alpha=.05, nChain=3, niterPerChain=20,
                                  method = "coeff", parallel = parallel)
               , "dimension")
  expect_error(postInference.MHLS(X=X[,-1], Y=Y, lbd=lbd, weights = weights,
                                  sig2.hat=1, alpha=.05, nChain=3, niterPerChain=20,
                                  method = "coeff", parallel = parallel)
               , "length")

  # expect_warning(postInference.MHLS(X=X, Y=Y, B0=B0, S0=S0, lbd=lbd, weights = weights,
  #                                   sig2.hat=1, alpha=.05, nChain=3, niterPerChain=20, parallel = FALSE, ncores = 10000)
  #                , "ncores is larger")
  if(.Platform$OS.type != "windows"){
    expect_warning(postInference.MHLS(X=X, Y=Y, lbd=lbd, weights = weights,
                                      method = "coeff",
                                      sig2.hat=1, alpha=.05, nChain=3, niterPerChain=20, parallel = TRUE, ncores = 1)
                   , "needs to be greater than 1")
  } else {
    expect_warning(postInference.MHLS(X=X, Y=Y, lbd=lbd, weights = weights,
                                      method = "coeff",
                                      sig2.hat=1, alpha=.05, nChain=3, niterPerChain=20, parallel = TRUE)
                   , "Under Windows platform")
  }
})



