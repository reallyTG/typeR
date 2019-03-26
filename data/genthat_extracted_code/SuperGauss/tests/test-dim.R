library(SuperGauss)
source("SuperGauss-test-functions.R")
context("Dimensions")

test_that("dim/nrow/ncol", {
  case.par <- expand.grid(N = round(abs(rnorm(n = 10, mean = 50, sd = 10))),
                          pre = c(TRUE, FALSE))
  ncase <- nrow(case.par)
  for(ii in 1:ncase){
    cp <- case.par[ii, ]
    N <- cp$N
    pre <- cp$pre
    acf <- acf.get.SGtest(N, "fbm", runif(1))
    if(pre) {
      Toep <- Toeplitz(n = N)
    } else {
      Toep <- Toeplitz(acf = acf)
    }
    expect_equal(nrow(Toep), N)
    expect_equal(ncol(Toep), N)
    expect_equal(dim(Toep), c(N,N))
  }
})
