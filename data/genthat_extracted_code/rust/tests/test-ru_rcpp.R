context("Bounding box using ru_rcpp")

# Checks the values in the ratio-of-uniforms bounding box returned by ru_rcpp()
# for some examples in which these values can be found explicitly.
# The examples are:
#   A: d-dimensional normal density for d = 1, 2, 3.
#   B: 1-dimensional log-normal density under log transformation back to the
#      normal density
#   C: 1-dimensional gamma density, with shape parameter not less than 1

# A. d-dimensional normal density

normal_box <- function(d, sigma = diag(d), rotate = TRUE, r = 1 / 2) {
  #
  # Calculates bounding box values in the case of a zero-mean unnormalized
  # d-dimensional normal density, with arbitrary covariance structure.
  # "Unnormalized" means that the function has a maximum of 1 attained
  # at the origin, which is what is required for comparabilty with the
  # output from the function ru(), which scales the input function to have
  # a maximum of 1 and relocates the mode to the origin.
  #
  # Args:
  #   d      : dimension of target density.
  #   sigma  : the covariance matrix of the normal density.
  #   rotate : should the rotation transformation used in the function ru()
  #            be applied?
  #   r      : ratio-of-uniforms tuning parameter.
  #
  # Returns:
  #   box : a  (2 * d + 1) by d + 2 matrix of ratio-of-uniforms bounding box
  #         information with the same structure as object$box returned by
  #         ru().
  #
  # Make sure that sigma is a matrix
  sigma <- as.matrix(sigma)
  # If d > 1 and if rotate = TRUE calculate the covariance matrix after
  # the rotation applied in the function ru.  The inverse of the
  # covariance matrix sigma plays the role of hess_mat in the function ru.
  if (rotate & d > 1) {
    l_mat <- t(chol(solve(sigma)))
    l_mat <- l_mat / det(l_mat) ^ (1/d)
    sigma <- t(l_mat) %*% sigma %*% l_mat
  }
  # Respective values at which bminus and bplus are obtained for each of
  # the d marginal variables in the N(0, 1), independent components case.
  val <- sqrt((r * d + 1) / r)
  # Calculate box
  ar <- 1
  bplus <- val * exp(-1 /2) * sqrt(diag(sigma))
  bminus <- -bplus
  box <- c(ar, bminus, bplus)
  # Adjustment of val for the marginal variances and for the correlation
  # between the components.
  adj_mat <- t(sqrt(diag(sigma)) * stats::cov2cor(sigma))
  vals <- rbind(rep(0, d), -val * adj_mat, val * adj_mat)
  colnames(vals) <- paste("vals", 1:d, sep="")
  # We hope to get perfect convegence indicators
  conv <- rep(0, 2 * d + 1)
  # Create matrix of bounding box information
  box <- cbind(box, vals, conv)
  bs <- paste(paste("b", 1:d, sep=""),rep(c("minus", "plus"), each=d), sep="")
  rownames(box) <- c("a", bs)
  #
  return(box)
}

my_tol <- 1e-5

# 1. 1-dimensional normal

# (a) N(0, 1)

ptr_N01 <- create_xptr("logdN01")
x1a <- ru_rcpp(logf = ptr_N01, d = 1, n = 1, init = 0)
test_that("N(0,1)", {
  testthat::expect_equal(x1a$box, normal_box(d = 1), tolerance = my_tol)
})

# (b) N(0, 2)

ptr_mvn <- create_xptr("logdmvnorm")
sigma <- 2 # Note: sigma means variance here
covmat <- matrix(sigma, 1, 1)
x1b <- ru_rcpp(logf = ptr_mvn, sigma = covmat, d = 1, n = 1, init = 0)
test_that("N(0,2)", {
  testthat::expect_equal(x1b$box, normal_box(d = 1, sigma = 2),
                         tolerance = my_tol)
})

# 2. 2-dimensional normal

# (a) Zero mean, unit variances and independent components
#     Note: rotating shouldn't make any difference in this example.

ptr_bvn <- create_xptr("logdnorm2")

# (i) rotate = TRUE
rho <- 0
x2ai <- ru_rcpp(logf = ptr_bvn, rho = rho, d = 2, n = 1, init = c(0, 0),
                rotate = TRUE)
test_that("BVN, rotation", {
  testthat::expect_equal(x2ai$box, normal_box(d = 2), tolerance = my_tol)
})

# (ii) rotate = FALSE
x2aii <- ru_rcpp(logf = ptr_bvn, rho = rho, d = 2, n = 1, init = c(0, 0),
                 rotate = FALSE)
test_that("BVN, no rotation", {
  testthat::expect_equal(x2aii$box, normal_box(d = 2), tolerance = my_tol)
})

# (b) Zero mean, unit variances with positive association

ptr_mvn <- create_xptr("logdmvnorm")
rho <- 0.9
covmat <- matrix(c(1, rho, rho, 1), 2, 2)

# (i) rotate = FALSE
x2bi <- ru_rcpp(logf = ptr_mvn, sigma = covmat, d = 2, n = 1, init = c(0, 0),
                rotate = FALSE)
test_that("BVN, rho = 0.9, no rotation", {
  testthat::expect_equal(x2bi$box, normal_box(d = 2, sigma = covmat,
                                              rotate = FALSE),
                         tolerance = my_tol)
})

# (ii) rotate = TRUE
x2bii <- ru_rcpp(logf = ptr_mvn, sigma = covmat, d = 2, n = 1, init = c(0, 0),
                rotate = TRUE)
test_that("BVN, rho = 0.9, rotation", {
  testthat::expect_equal(x2bii$box, normal_box(d = 2, sigma = covmat,
                                               rotate = TRUE),
                         tolerance = my_tol)
})

# (c) Zero mean, different variances with positive association
covmat <- matrix(c(10, 3, 3, 2), 2, 2)

# (i) rotate = FALSE
x2ci <- ru_rcpp(logf = ptr_mvn, sigma = covmat, d = 2, n = 1, init = c(0, 0),
                rotate = FALSE)
test_that("BVN, general Sigma, no rotation", {
  testthat::expect_equal(x2ci$box, normal_box(d = 2, sigma = covmat,
                                              rotate = FALSE),
                         tolerance = my_tol)
})

# (ii) rotate = TRUE
x2cii <- ru_rcpp(logf = ptr_mvn, sigma = covmat, d = 2, n = 1, init = c(0, 0),
                 rotate = TRUE)
test_that("BVN, general Sigma, rotation", {
  testthat::expect_equal(x2cii$box, normal_box(d = 2, sigma = covmat,
                                               rotate = TRUE),
                         tolerance = my_tol)
})

# (d) Mean (1,2), different variances with negative association
covmat <- matrix(c(10, -3, -3, 2), 2, 2)

# (i) rotate = FALSE
x2di <- ru_rcpp(logf = ptr_mvn, sigma = covmat, d = 2, n = 1, init = c(0, 0),
                rotate = FALSE, mean = c(1, 2))
test_that("BVN, non-zero mu, general Sigma, no rotation", {
  testthat::expect_equal(x2di$box, normal_box(d = 2, sigma = covmat,
                                              rotate = FALSE),
                         tolerance = my_tol)
})

# (ii) rotate = TRUE
x2dii <- ru_rcpp(logf = ptr_mvn, sigma = covmat, d = 2, n = 1, init = c(0, 0),
                 rotate = TRUE, mean = c(1, 2))
test_that("BVN, non-zero mu, general Sigma, rotation", {
  testthat::expect_equal(x2dii$box, normal_box(d = 2, sigma = covmat,
                                               rotate = TRUE),
                         tolerance = my_tol)
})

# 3. 3-dimensional normal

# (a) Zero mean, unit variances with positive association
covmat <- matrix(rho, 3, 3) + diag(1 - rho, 3)

# (i) rotate = FALSE
x3ai <- ru_rcpp(logf = ptr_mvn, sigma = covmat, d = 3, n = 1,
                init = c(0, 0, 0), rotate = FALSE)
test_that("TVN, rho = 0.9, no rotation", {
  testthat::expect_equal(x3ai$box, normal_box(d = 3, sigma = covmat,
                                              rotate = FALSE),
                         tolerance = my_tol)
})

# (ii) rotate = TRUE
x3aii <- ru_rcpp(logf = ptr_mvn, sigma = covmat, d = 3, n = 1,
                 init = c(0, 0, 0), rotate = TRUE)
test_that("TVN, rho = 0.9, rotation", {
  testthat::expect_equal(x3aii$box, normal_box(d = 3, sigma = covmat,
                                               rotate = TRUE),
                         tolerance = my_tol)
})

# B. 1-dimensional log-normal density

# Check that using a log transformation takes us back to the standard
# normal case
lambda <- 0
ptr_lnorm <- create_xptr("logdlnorm")
mu <- 0
sigma <- 1
lambda <- 0
x <- ru_rcpp(logf = ptr_lnorm, mu = mu, sigma = sigma, d = 1, n = 1,
             lower = 0, init = 0.1, trans = "BC", lambda = lambda)
test_that("Log-normal", {
  testthat::expect_equal(x$box, normal_box(d = 1), tolerance = my_tol)
})

# C: 1-dimensional gamma density, with shape parameter not less than 1

gamma_box <- function(shape = 1, rate = 1, r = 1 / 2) {
  #
  # Calculates bounding box values in the case of a zero-mean unnormalized
  # d-dimensional normal density, with arbitrary covariance structure.
  # "Unnormalized" means that the function has a maximum of 1 attained
  # at the origin, which is what is required for comparabilty with the
  # output from the function ru(), which scales the input function to have
  # a maximum of 1 and relocates the mode to the origin.
  #
  # Args:
  #   shape  : gamma shape parameter.
  #   rate   : gamma rate parameter.
  #   r      : ratio-of-uniforms tuning parameter.
  #
  # Returns:
  #   box : a  3 by 3 matrix of ratio-of-uniforms bounding box information
  #         with the same structure as object$box returned by ru().
  #
  if (shape < 1) {
    stop("A ratio-of-uniforms bounding box cannot be found when shape < 1")
  }
  # Mode of the gamma(shape, rate) density
  x_mode <- (shape - 1) / rate
  # Value of the (normalized) density at the mode
  x_max <- stats::dgamma(x_mode, shape = shape, rate = rate)
  #
  # Calculate box
  ar <- 1
  a_quad <- rate * r / (r + 1)
  b_quad <- -(1 + r * (shape - 1) / (r + 1) - a_quad * x_mode)
  c_quad <- -x_mode
  b_vals <- Re(polyroot(c(c_quad, b_quad, a_quad)))
  vals1 <- c(0, b_vals)
  b_fun <- function(x) {
    x * (stats::dgamma(x + x_mode, shape = shape) / x_max) ^ (r / (r + 1))
  }
  box <- c(ar, b_fun(b_vals))
  # Create matrix of bounding box information
  conv <- rep(0, 3)
  box <- cbind(box, vals1, conv)
  bs <- paste(paste("b", 1, sep=""),rep(c("minus", "plus"), each=1), sep="")
  rownames(box) <- c("a", bs)
  #
  return(box)
}

ptr_gam <- create_xptr("logdgamma")

# Shape = 1
alpha <- 1
x1 <- suppressWarnings(ru_rcpp(logf = ptr_gam, alpha = alpha, d = 1, n = 1,
              lower = 0, init = alpha))
test_that("Gamma(1, 1)", {
  testthat::expect_equal(x1$box, gamma_box(shape = 1), tolerance = my_tol)
})

# Shape = 10
alpha <- 10
x2 <- ru_rcpp(logf = ptr_gam, alpha = alpha, d = 1, n = 1,
             lower = 0, init = alpha)
test_that("Gamma(10, 1)", {
  testthat::expect_equal(x2$box, gamma_box(shape = 10), tolerance = my_tol)
})



