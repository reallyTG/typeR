# Tests for the functions in the helper_functions file

library(scdensity)
context("Calls to helper functions")


test_that("ConvolutionMatrix works", {
  x <- rnorm(20)
  y <- rnorm(30)
  L1 <- ConvolutionMatrix(x,y,0.1,threshold=-10000)  #choose threshold so no spectral shifts.
  L2 <- ConvolutionMatrix(x,x,0.1,threshold=-10000)
  expect_equal(dim(L1)[1], length(x))
  expect_equal(dim(L1)[2], length(y))
  expect_equal(dim(L2), c(20,20))
  expect_true(all(diag(L2) == rep(1/(2*sqrt(pi)),20)))
  expect_true(all(L1 < 1))
  expect_true(all(L2 <= 1))
})


test_that("SpecralShift works", {
  nrep <- 1000
  n <- 20
  isokay <- rep(FALSE, nrep)
  th <- 1e-10
  for (i in 1:nrep){
    x <- sort(rnorm(n))
    h <- bw.SJ(x)
    L <- ConvolutionMatrix(x, x, h, threshold=th)
    isokay[i] <- min(eigen(L)$values) >= 0.999*th
  }
  expect_true(all(isokay))
})


test_that("SequentialLineMin works", {
  # use a function of 3 variables, with minimum at c(1,2,3)
  fcn <- function(v) (v[1]-1)^2 + (v[2]-2)^2 + (v[3]-3)^2
  bnd <- c(-0.5, 5.5)
  start <- c(2.5, 2.5, 2.5)
  soln <- SequentialLineMin(fcn, bnd, start)
  truth <- c(1,2,3)
  expect_lt(sum(abs(soln$minimizer - truth)), 0.001)
  expect_lt(abs(soln$minimum), 0.001)
})


test_that("getQuantile works", {
  x <- seq(-5,5,length.out=500)
  y <- dnorm(x)
  checkpts <- c(0.05, 0.1, 0.3, 0.5, 0.7, 0.9, 0.95)
  myQuantiles <- getQuantile(x, y , checkpts)
  realQuantiles <- qnorm(checkpts)
  expect_lt(max(abs(myQuantiles - realQuantiles)), 0.05)
})


test_that("NormalGridFcn works", {
  # Just test the function here, not its derivatives...
  centers <- seq(-1, 1, length.out=10)
  bw <- 0.02
  pdf <- density(x=centers, bw=bw, kernel="gaussian", n=25)
  NG <- NormalGridFcn(pdf$x, 0, centers, bw)
  pdf2 <- apply(NG, 1, sum)/10
  expect_lt(max(abs(pdf$y - pdf2)), 0.01)
})
