library(SuperGauss)
source("SuperGauss-test-functions.R")
context("Derivative of Trace of Matrix-Product")

test_that("Superfast and regular algorithms agree", {
  case.par <- expand.grid(type = c("exp", "exp2", "fbm", "matern"),
                          first20 = c(TRUE, FALSE),
                          first30 = c(TRUE, FALSE),
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
    acf3 <- runif(1) * matern.acf(tseq = (1:N-1)*dT, lambda = rexp(1), nu = rexp(1))
    if(cp$first20) acf2[1] <- 0
    if(cp$first30) acf3[1] <- 0
    Toep$setAcf(acf1)
    trace.rst <- trace.SGtest(solve(toeplitz(acf1), toeplitz(acf2)) %*% solve(toeplitz(acf1), toeplitz(acf3)))
    expect_equal(Toep$traceT4(acf2, acf3), trace.rst)
  }
})
