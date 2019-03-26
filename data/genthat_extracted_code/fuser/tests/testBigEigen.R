library(fuser)

# Test bigeigen function for calculating eigenvalues of large matrices
set.seed(123)

# Generate simple heterogeneous dataset
k = 4 # number of groups
p = 10001 # large number of covariates
n.group = 500 # number of samples per group
groups = rep(1:k, each=n.group) # group indicators

X = lapply(1:k, function(k.i) matrix(rnorm(n.group*p),n.group, p)) # covariates
X = Matrix::Matrix(do.call('rbind', X))

test_that("bigeigen: Test results are the same for RSpectra and irlba method", {
  expect_lt(abs(bigeigen(X,'RSpectra') - bigeigen(X, 'irlba')), 1e-4)
})

# Small example for testing eigenvalue correct
k = 4 # number of groups
p = 201 # large number of covariates
n.group = 50 # number of samples per group
groups = rep(1:k, each=n.group) # group indicators

X = lapply(1:k, function(k.i) matrix(rnorm(n.group*p),n.group, p)) # covariates
X = do.call('rbind', X)

test_that("bigeigen: Test results are the same for RSpectra and irlba method", {
  expect_lt(abs(bigeigen(X) - eigen(t(X) %*% X, only.values=TRUE)$values[1]), 1e-4)
})
