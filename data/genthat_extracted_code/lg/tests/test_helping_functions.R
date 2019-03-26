library(lg)
context("Helping functions")

x1_single    <- 1
x2_single    <- 2
mu_1_single  <- 1
mu_2_single  <- 2
sig_1_single <- 3
sig_2_single <- 4
rho_single   <- 0

eval_points <- cbind(c(1, 2, 3), c(1, 2, 3))
mu_1 <- c(0, 1, 2)
mu_2 <- c(-1, 0, 1)
sig_1 <- c(1, 2, 3)
sig_2 <- c(2, 3, 4)
rho <- c(-.5, 0, .5)

mu_1_wrong_length <- c(0, 0)
mu_1_not_numeric <- "a"
eval_points_1col <- cbind(c(1,1))

test_that("dmvnorm_wrapper_single works properly", {
    expect_equal(dnorm(x1_single, mean = mu_1_single, sd = sig_1_single)*
                 dnorm(x2_single, mean = mu_2_single, sd = sig_2_single),
                 dmvnorm_wrapper_single(x1 = x1_single,
                                        x2 = x2_single,
                                        mu_1 = mu_1_single,
                                        mu_2 = mu_2_single,
                                        sig_1 = sig_1_single,
                                        sig_2 = sig_2_single,
                                        rho = rho_single))
    expect_equal(length(dmvnorm_wrapper(eval_points, mu_1, mu_2, sig_1, sig_2, rho)),
                 length(mu_1))
    expect_equal(length(dmvnorm_wrapper(cbind(x1_single, x2_single),
                                        mu_1_single,
                                        mu_2_single,
                                        sig_1_single,
                                        sig_2_single,
                                        rho_single)),
                 length(mu_1_single))
    expect_error(dmvnorm_wrapper(eval_points, mu_1_wrong_length, mu_2, sig_1, sig_2, rho),
                 "Mismatch in dimensions in dmvnorm_wrapper")
    expect_error(dmvnorm_wrapper(eval_points, mu_1_not_numeric, mu_2, sig_1, sig_2, rho),
                 "All arguments must be numeric")
    expect_error(dmvnorm_wrapper(eval_points_1col, mu_1, mu_2, sig_1, sig_2, rho),
                 "eval_points must be a matrix with 2 columns")
})
