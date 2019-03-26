
context("Metropolis Hastings")

#-------------------------
# Low dim
#-------------------------
set.seed(123)
n <- 10
p <- 5
X <- matrix(rnorm(n * p), n)
Y <- X %*% rep(1, p) + rnorm(n)
sigma2 <- 1
lbd <- .37
weights <- rep(1, p)
LassoResult <- lassoFit(X = X, Y = Y, type = "lasso", lbd = lbd, weights = weights)
B0 <- LassoResult$B0
S0 <- LassoResult$S0

test_that("Low dimensional setting under lasso setting", {
  # Expect NA
  expect_error(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 1,
                    B0 = B0, S0 = S0, niter = 50, burnin = 0,
                    PEtype = "coeff", verbose = FALSE), NA)
  expect_error(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 1,
                    B0 = B0, niter = 50, burnin = 0,
                    PEtype = "coeff", verbose = FALSE), NA)
  expect_error(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 1,
                    B0 = B0, S0 = S0, niter = 50, A = 1:p, burnin = 0,
                    PEtype = "coeff", verbose = FALSE), NA)
  expect_error(MHLS(X = X, PE = rep(0, n), sig2 = 1, lbd = 1,
                    B0 = B0, S0 = S0, niter = 50, burnin = 0,
                    PEtype = "mu", verbose = FALSE), NA)
  expect_error(MHLS(X = X, PE = rep(0, n), sig2 = 1, lbd = 1,
                    B0 = B0, niter = 50, burnin = 0,
                    PEtype = "mu", verbose = FALSE), NA)
  expect_error(MHLS(X = X, PE = rep(0, n), sig2 = 1, lbd = 1,
                    B0 = B0, S0 = S0, niter = 50, A = 1:p, burnin = 0,
                    PEtype = "mu", verbose = FALSE), NA)
  # Expect error
  expect_error(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 1,
                    B0 = B0, S0 = S0, A = 1:(p+1), niter = 50, burnin = 0,
                    PEtype = "coeff", verbose = FALSE)
               , "Invalid active")
  expect_error(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 1,
                    B0 = B0, S0 = S0, A = c(1,1:p), niter = 50, burnin = 0,
                    PEtype = "coeff", verbose = FALSE)
               , "Invalid active")
  expect_error(MHLS(X = X, PE = rep(0, p-1), sig2 = 1, lbd = 1,
                    B0 = B0, S0 = S0, niter = 50, burnin = 0,
                    PEtype = "coeff", verbose = FALSE)
               , "length")
  expect_error(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 1,
                    B0 = c(0,B0), S0 = S0, niter = 50, burnin = 0,
                    PEtype = "coeff", verbose = FALSE)
               , "length")
  expect_error(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 1,
                    B0 = B0, S0 = c(0,S0), niter = 50, burnin = 0,
                    PEtype = "coeff", verbose = FALSE)
               , "length")
  expect_error(MHLS(X = X, PE = rep(0, p), sig2 = -1, lbd = 1,
                    B0 = B0, S0 = S0, niter = 50, burnin = 0,
                    PEtype = "coeff", verbose = FALSE)
               , "sig2 and/or lbd")
  expect_error(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 0,
                    B0 = B0, S0 = S0, niter = 50, burnin = 0,
                    PEtype = "coeff", verbose = FALSE)
               , "sig2 and/or lbd")
  expect_error(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 1,
                    B0 = B0, S0 = rep(0,p), niter = 50, burnin = 0,
                    PEtype = "coeff", verbose = FALSE)
               , "Invalid S0")
  expect_error(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 1,
                    B0 = B0, S0 = S0, niter = 50, burnin = 0, FlipSA = 1:p,
                    PEtype = "coeff", verbose = FALSE)
               , "FlipSA has to be a subset")
})

# set.seed(123)
# n <- 10
# p <- 5
# X <- matrix(rnorm(n * p), n)
# Y <- X %*% rep(1, p) + rnorm(n)
# sigma2 <- 1
# lbd <- 1
# group <- c(1, 1, 2, 2, 2)
# weights <- rep(1, max(group))
# LassoResult <- lassoFit(X = X, Y = Y, type = "grlasso", group = group, lbd = lbd, weights = weights)
# B0 <- LassoResult$B0
# S0 <- LassoResult$S0
#
#
# test_that("Low dimensional setting under group lasso setting", {
#   # Expect NA
#   expect_error(MHLS(X = X, PE = rep(0, 5), sig2 = 1, lbd = 1,
#                     B0 = B0, S0 = S0, group = group, niter = 50,
#                     burnin = 0, PEtype = "coeff", verbose = FALSE), NA)
#   expect_error(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 1,
#                     B0 = B0, S0 = S0, group = group, niter = 50, A = c(1, 2),
#                     burnin = 0, PEtype = "coeff", verbose = FALSE), NA)
#   # Expect error
#   expect_error(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 1,
#                     B0 = B0, group = group, niter = 50, burnin = 0,
#                     PEtype = "coeff", verbose = FALSE)
#                , "Missing S0")
#   expect_error(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 1,
#                     B0 = B0, S0 = S0, group = group, A = 1:(p+1), niter = 50, burnin = 0,
#                     PEtype = "coeff", verbose = FALSE)
#                , "Invalid active")
#   expect_error(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 1,
#                     B0 = B0, S0 = S0, group = group, A = c(1,1:p), niter = 50, burnin = 0,
#                     PEtype = "coeff", verbose = FALSE)
#                , "Invalid active")
#   expect_error(MHLS(X = X, PE = rep(0, p-1), sig2 = 1, lbd = 1,
#                     B0 = B0, S0 = S0, group = group, niter = 50, burnin = 0,
#                     PEtype = "coeff", verbose = FALSE)
#                , "length")
#   expect_error(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 1,
#                     B0 = c(0,B0), S0 = S0, group = group, niter = 50, burnin = 0,
#                     PEtype = "coeff", verbose = FALSE)
#                , "length")
#   expect_error(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 1,
#                     B0 = B0, S0 = c(0,S0), group = group, niter = 50, burnin = 0,
#                     PEtype = "coeff", verbose = FALSE)
#                , "length")
#   expect_error(MHLS(X = X, PE = rep(0, p), sig2 = -1, lbd = 1,
#                     B0 = B0, S0 = S0, group = group, niter = 50, burnin = 0,
#                     PEtype = "coeff", verbose = FALSE)
#                , "sig2 and/or lbd")
#   expect_error(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 0,
#                     B0 = B0, S0 = S0, group = group, niter = 50, burnin = 0,
#                     PEtype = "coeff", verbose = FALSE)
#                , "sig2 and/or lbd")
#   expect_error(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 1,
#                     B0 = B0, S0 = rep(0,p), group = group, niter = 50, burnin = 0,
#                     PEtype = "coeff", verbose = FALSE)
#                , "Invalid S0")
# })
#-------------------------
# High dim
#-------------------------
set.seed(123)
n <- 5
p <- 10
X <- matrix(rnorm(n*p),n)
Y <- X %*% rep(1,p) + rnorm(n)
sigma2 <- 1
lbd <- .37
weights <- rep(1,p)
LassoResult <- lassoFit(X = X,Y = Y, type = "lasso", lbd = lbd,weights = weights)
B0 <- LassoResult$B0
S0 <- LassoResult$S0
A <- which(B0!=0)

test_that("Low dimensional setting under lasso setting", {
  # Expect NA
  expect_error(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 1,
                    B0 = B0, S0 = S0, niter = 50, burnin = 0,
                    PEtype = "coeff", verbose = FALSE), NA)
  expect_error(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 1,
                    B0 = B0, niter = 50, burnin = 0,
                    PEtype = "coeff", verbose = FALSE), NA)
  expect_error(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 1,
                    B0 = B0, S0 = S0, niter = 50, A = c(1,2,A), burnin = 0,
                    PEtype = "coeff", verbose = FALSE), NA)
  # Expect error
  # expect_error(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 1,
  #                   group = rep(c(1,2),each=5), B0 = B0, S0 = S0, niter = 50,
  #                   burnin = 0, PEtype = "coeff")
  #              , "Low dimensional data")
  expect_error(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 1,
                    B0 = B0, S0 = S0, A = 0:(p-1), niter = 50, burnin = 0,
                    PEtype = "coeff", verbose = FALSE)
               , "Invalid active")
  expect_error(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 1,
                    B0 = B0, S0 = S0, A = c(1,1:p), niter = 50, burnin = 0,
                    PEtype = "coeff", verbose = FALSE)
               , "Invalid active")
  expect_error(MHLS(X = X, PE = rep(0, p-1), sig2 = 1, lbd = 1,
                    B0 = B0, S0 = S0, niter = 50, burnin = 0,
                    PEtype = "coeff", verbose = FALSE)
               , "length")
  expect_error(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 1,
                    B0 = c(0,B0), S0 = S0, niter = 50, burnin = 0,
                    PEtype = "coeff", verbose = FALSE)
               , "length")
  expect_error(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 1,
                    B0 = B0, S0 = c(0,S0), niter = 50, burnin = 0,
                    PEtype = "coeff", verbose = FALSE)
               , "length")
  expect_error(MHLS(X = X, PE = rep(0, p), sig2 = -1, lbd = 1,
                    B0 = B0, S0 = S0, niter = 50, burnin = 0,
                    PEtype = "coeff", verbose = FALSE)
               , "sig2 and/or lbd")
  expect_error(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 0,
                    B0 = B0, S0 = S0, niter = 50, burnin = 0,
                    PEtype = "coeff", verbose = FALSE)
               , "sig2 and/or lbd")
  expect_error(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 1,
                    B0 = B0, S0 = rep(0,p), niter = 50, burnin = 0,
                    PEtype = "coeff", verbose = FALSE)
               , "Invalid S0")
  expect_error(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 1,
                    B0 = B0, S0 = S0, niter = 50, burnin = 0, FlipSA = 1:p,
                    PEtype = "coeff", verbose = FALSE)
               , "FlipSA has to be a subset")
})
