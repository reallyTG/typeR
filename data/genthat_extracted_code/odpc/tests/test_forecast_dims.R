library(odpc)
context("Test that forecast method gets dimensions right")

set.seed(1234)
N <- 200 #length of series
m <- 10 #number of series
set.seed(1234)
f <- rnorm(N + 1)
x_small <- matrix(0, N, m)
u <- matrix(rnorm(N * m), N, m)
for (i in 1:m) {
  x_small[, i] <- 10 * sin(2 * pi * (i/m)) * f[1:N] + 10 * cos(2 * pi * (i/m)) * f[2:(N + 1)] + u[, i]
}

N <- 70 #length of series
m <- 70 #number of series
set.seed(1234)
f <- rnorm(N + 1)
x_large <- matrix(0, N, m)
u <- matrix(rnorm(N * m), N, m)
for (i in 1:m) {
  x_large[, i] <- 10 * sin(2 * pi * (i/m)) * f[1:N] + 10 * cos(2 * pi * (i/m)) * f[2:(N + 1)] + u[, i]
}
ks <- matrix(c(1, 2, 3, 1), nrow=2, ncol=2)
ind_recons1 <- ks[1, 1] + ks[1, 2] + 1
ind_recons2 <- ind_recons1 + ks[2, 1] + ks[2, 2]

fit_small <- odpc(x_small, ks=ks, tol=1e-2)
hs <- c(1, 3, 6, 12)

for (h in hs){
  test_that(paste0('Correct dimension of forecast, m<T for h=', h),{
    fore <- forecast.odpcs(fit_small, h=h)
    expect_equal(dim(fore), c(h, ncol(x_small)))
  })
}

fit_large <- odpc(x_large, ks=ks, tol=1e-2)
hs <- c(1, 3, 6, 12)

for (h in hs){
  test_that(paste0('Correct dimension of forecast, m>T, for h=', h),{
    fore <- forecast.odpcs(fit_large, h=h)
    expect_equal(dim(fore), c(h, ncol(x_large)))
  })
}