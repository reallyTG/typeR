context("Testing corrected lasso")

suppressWarnings(RNGversion("3.5.0"))
set.seed(100)
n <- 100 # Number of samples
p <- 5 # Number of covariates
X <- matrix(rnorm(n * p), nrow = n)  # True (latent) variables
sigmaUU <- diag(x = 0.2, nrow = p, ncol = p) # Measurement error covariance matrix (typically estimated by replicate measurements)
W <- X + rnorm(n, sd = diag(sigmaUU)) # Measurement matrix (this is the one we observe)
beta <- c(seq(from = 0.1, to = 1, length.out = 5), rep(0, p-5)) # Coefficient
y <- X %*% beta + rnorm(n, sd = 1) # Response
fit <- fit_corrected_lasso(W, y, sigmaUU, family = "gaussian", no_radii = 2) # Run the corrected lasso

test_that("fit_corrected_lasso returns right object", {
  expect_output(str(fit), "List of 2")
  expect_equal(class(fit), "corrected_lasso")
})

cv_fit <- cv_corrected_lasso(W, y, sigmaUU, n_folds = 2, no_radii = 10)

test_that("cv_corrected_lasso returns right object", {
  expect_output(str(cv_fit), "List of 5")
  expect_equal(class(cv_fit), "cv_corrected_lasso")
})

test_that("cv_corrected_lasso computes correctly", {
  expect_equal(round(cv_fit$radius_min, 2), round(2.19, 2))
  expect_equal(round(cv_fit$loss_min, 2), round(1.13, 2))
  expect_equal(round(cv_fit$radius_1se, 2), round(1.10, 2))
  expect_equal(round(cv_fit$loss_1se, 2), round(1.52, 2))
})

# Now check the logistic version
y <- rbinom(n, size = 1, prob = hdme:::logit(X %*% c(rep(5, 2), rep(0, p-2))))
fit <- fit_corrected_lasso(W, y, sigmaUU, family = "binomial", no_radii = 6)

test_that("fit_corrected_lasso returns right object for logistic regression", {
  expect_output(str(fit), "List of 2")
  expect_equal(class(fit), "corrected_lasso")
})

test_that("fit_corrected_lasso has right dimension in beta vectors", {
          expect_equal(dim(fit$betaCorr), c(5, 6))
          expect_equal(length(fit$radii), 6L)
          })
