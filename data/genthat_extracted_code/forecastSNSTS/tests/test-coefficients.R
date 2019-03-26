context("coefficients")

# In this file we compute the linear forecasts as defined in
# Section 3.4 of the paper naively (with plain R) and compare
# to the C++ implementation that is more efficient.

# We will do it for one t, h, p and N

naive_predCoef <- function (X, p, h, t, N) {

  # We first need the local autocovariances for k = 0, 1, ..., p
  gamma <- rep(0, p+1)
  for (k in 0:p) {
    l <- (t-N+abs(k)+1):t
    gamma[k+1] <- sum(X[l-abs(k)] * X[l]) / (N-k)
  }
  
  # Now define the matrix Gam_p and the vector gam_p
  Gam_p <- matrix(ncol = p, nrow = p)
  for (i1 in 1:p) {
    for (i2 in 1:p) {
      Gam_p[i1, i2] <- gamma[abs(i1-i2)+1]
    }
  }
  gam_p <- gamma[2:(p+1)]
  
  # This yields the localised Yule-Walker estimator:
  a_p <- solve(Gam_p) %*% gam_p
  
  # Define the matrix from the state space form:
  A_p <- rbind(t(a_p), cbind(diag(rep(1, p-1)), rep(0,p-1)) )
  
  V_p <- diag(rep(1,p))
  for (i in 1:h) {
    V_p <- V_p %*% A_p
  }
  
  v_p <- c(1,rep(0,p-1)) %*% V_p

  return (v_p)
  
}
#t(a_p) - a_p_c[5,,1,1,1]
##v_p - a_p_c[5,,4,1,1]

# The time series will be
X <- rnorm(20)

test_that("predCoef works for h = 1, when one is computed", {
      
  naiveRes <- naive_predCoef(X, 3, 1, 18, 7)
  cppRes <- predCoef(X, 3, 1, 18, 7)$coef[3, , 1, 1, 1]
      
  expect_equal(sum((naiveRes - cppRes)^2) , 0) #, tolerance=1e-8)
})

test_that("predCoef works for h = 1, when many are computed", {

  naiveRes <- naive_predCoef(X, 3, 1, 18, 7)
  cppRes <- predCoef(X, 3, 2, 15:18, 5:7)$coef[3, , 1, 4, 3]
  
  expect_equal(sum((naiveRes - cppRes)^2) , 0) #, tolerance=1e-8)
})

naiveRes <- naive_predCoef(X, 3, 2, 18, 7)
cppRes <- predCoef(X, 4, 2, 18, 7)$coef[3, 1:3 , 2, 1, 1]

test_that("predCoef works for h = 2", {
  expect_equal(sum((naiveRes - cppRes)^2) , 0) #, tolerance=1e-8)
})

# Now try the locally stationary option
naiveRes1 <- naive_predCoef(X, 3, 2, 18, 18)
naiveRes2 <- naive_predCoef(X, 3, 2, 19, 19)
cppRes1 <- predCoef(X, 3, 2, 18:20, 0)$coef[3, , 2, 1, 1]
cppRes2 <- predCoef(X, 3, 2, 18:20, 0)$coef[3, , 2, 2, 1]

test_that("predCoef works for locally stationary", {
      expect_equal(sum((naiveRes1 - cppRes1)^2) , 0) #, tolerance=1e-8)
      expect_equal(sum((naiveRes2 - cppRes2)^2) , 0) #, tolerance=1e-8)
    })