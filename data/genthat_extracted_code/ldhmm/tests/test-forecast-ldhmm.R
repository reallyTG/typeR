library(xts)
library(zoo)

context("Test on ldhmm forecast")

eps <- 0.001 # default tolerance of error for real number
eps5 <- 0.00001 # high precision

# mle optimization result from m2p3
m <- 2
param0 <- matrix(
  c(0.002936740, 0.01977561, 1.141693,
   -0.001707031, 0.03718047, 1.324177), m, 3, byrow=TRUE)
gamma0 <- matrix(
  c(0.98083875, 0.01916125,
    0.04931245, 0.95068755), m, m, byrow=TRUE)

delta0 <- c(0.7201662, 0.2798338)

h <- ldhmm(m=m, param=param0, gamma=gamma0, delta=delta0)
spx <- ldhmm.ts_log_rtn(on="weeks")
x <- spx$x

# conditional probabilities
test_that("test SPX sum of conditional probabilities",{
  xc <- seq(-0.3, 0.3, length.out=300)
  cp <- ldhmm.conditional_prob(h, x, xc)
  dxc <- diff(xc)[1]
  cdf <- sapply(1:length(x), function (i) sum(cp[,i]) * dxc)

  expect_true(max(abs(cdf-1)) < eps)
})

# forecast probabilities
test_that("test SPX sum of forecast probabilities",{
  xf <- seq(-0.3, 0.3, length.out=300)
  cp <- ldhmm.forecast_prob(h, x, xf, h=10)
  dxf <- diff(xf)[1]
  cdf <- sapply(1:10, function (i) sum(cp[i,]) * dxf)
  
  expect_true(max(abs(cdf-1)) < eps)
})

# forecast states
test_that("test SPX sum of forecast states",{
  fs <- ldhmm.forecast_state(h, x, h=10)
  cdf <- sapply(1:NCOL(fs), function (i) sum(fs[,i]))
  
  expect_true(max(abs(cdf-1)) < eps)
})

# pseudo residuals


# mllk, alpha and beta
la <- ldhmm.log_forward(h, x)
lb <- ldhmm.log_backward(h, x)
mllk <- ldhmm.mllk(h, x=x)

test_that("test sum of alpha_T = -mllk",{
  la_T <- la[,NCOL(la)]
  mx <- max(la_T)
  lw_T <- mx + log(sum(exp(la_T-mx)))
  expect_true(abs(lw_T/mllk+1) < eps)
})

test_that("test beta_T = identity",{
  lb_T <- lb[,NCOL(lb)]
  one <- exp(lb_T)
  expect_true(max(abs(one-1)) < eps5)
})

test_that("test alpha_t dot beta_t = -mllk",{
    calc_lab <- function(i) {
        c <- la[,i] + lb[,i]
        max(c) + log(sum(exp(c-max(c))))
    }
  lab <- sapply(1:NCOL(la), calc_lab)
  expect_true(max(abs(lab/mllk+1)) < eps5)
})
