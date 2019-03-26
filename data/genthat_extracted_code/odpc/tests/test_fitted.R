library(odpc)
context("Test that fitted method gets dimensions and mses right")

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
k_tot_1 <- ks[1, 1] + ks[1, 2]
ind_recons1 <- k_tot_1 + 1
k_tot_2 <- ks[2, 1] + ks[2, 2]
ind_recons2 <- max(k_tot_1, k_tot_2) + 1


fit_small <- odpc(x_small, ks=ks, tol=1e-2)
pred1_small <- fitted(fit_small, num_comp = 1)
pred2_small <- fitted(fit_small, num_comp = 2)
recons1 <- x_small[ind_recons1:nrow(x_small),]
recons2 <- x_small[ind_recons2:nrow(x_small),]

test_that(paste0("Correct dimensions, first component for m<T"), {
  expect_equal(dim(recons1), dim(pred1_small))
})
test_that(paste0("Correct dimensions, second component for m<T"), {
  expect_equal(dim(recons2), dim(pred2_small))
})
test_that(paste0("Correct mse, first component for m<T"), {
  mse1 <- mean(( recons1 - pred1_small)^2)
  expect_equal(mse1, fit_small[[1]]$mse, tolerance=1e-2)
})
test_that(paste0("Correct mse, second component for m<T"), {
  mse2 <- mean(( recons2 - pred2_small)^2)
  expect_equal(mse2, fit_small[[2]]$mse, tolerance=1e-2)
})


fit_large <- odpc(x_large, ks=ks, tol=1e-2)
pred1_large <- fitted(fit_large, num_comp = 1)
pred2_large <- fitted(fit_large, num_comp = 2)
recons1 <- x_large[ind_recons1:nrow(x_large),]
recons2 <- x_large[ind_recons2:nrow(x_large),]

test_that(paste0("Correct dimensions, first component for m>T"), {
  expect_equal(dim(recons1), dim(pred1_large))
})
test_that(paste0("Correct dimensions, second component for m>T"), {
  expect_equal(dim(recons2), dim(pred2_large))
})
test_that(paste0("Correct mse, first component for m>T"), {
  mse1 <- mean(( recons1 - pred1_large)^2)
  expect_equal(mse1, fit_large[[1]]$mse, tolerance=1e-2)
})
test_that(paste0("Correct mse, second component for m>T"), {
  mse2 <- mean(( recons2 - pred2_large)^2)
  expect_equal(mse2, fit_large[[2]]$mse, tolerance=1e-2)
})