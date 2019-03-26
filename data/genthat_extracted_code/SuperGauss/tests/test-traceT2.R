library(SuperGauss)
source("SuperGauss-test-functions.R")
context("Trace of Matrix-Product")

test_that("trace of inversion of Toeplitz times Toeplitz", {
  case.par <- expand.grid(type = c("exp", "exp2", "fbm", "matern"),
                          first0 = c(TRUE, FALSE),
                          dT = c(1/60, 1/30, 1/15))
  ncase <- nrow(case.par)
  for(ii in 1:ncase){
    N <- sample(10:30, 1)
    Toep <- Toeplitz(N)
    cp <- case.par[ii, ]
    type <- as.character(cp$type)
    dT <- cp$dT
    acf1 <- rnorm(1, mean = 1e15) * acf.get.SGtest(N, type, dT)
    acf2 <- runif(1) * exp(-(1:N))
    if(cp$first0) acf2[1] <- 0
    Toep$setAcf(acf1)
    trace.rst <- trace.SGtest(solve(toeplitz(acf1), toeplitz(acf2)))
    expect_equal(Toep$traceT2(acf2), trace.rst)
  }
})
