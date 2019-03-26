library(fuser)

# Test of using fusion approach to model heterogeneous
# datasets
set.seed(123)

# Generate simple heterogeneous dataset
k = 4 # number of groups
p = 100 # number of covariates
n.group = 15 # number of samples per group
sigma = 0.05 # observation noise sd
groups = rep(1:k, each=n.group) # group indicators

# sparse linear coefficients
beta = matrix(0, p, k)
nonzero.ind = rbinom(p*k, 1, 0.025/k) # Independent coefficients
nonzero.shared = rbinom(p, 1, 0.025) # shared coefficients
beta[which(nonzero.ind==1)] = rnorm(sum(nonzero.ind), 1, 0.25)
beta[which(nonzero.shared==1),] = rnorm(sum(nonzero.shared), -1, 0.25)

X = lapply(1:k, function(k.i) matrix(rnorm(n.group*p),n.group, p)) # covariates
y = sapply(1:k, function(k.i) X[[k.i]] %*% beta[,k.i] + rnorm(n.group, 0, sigma)) # response
X = do.call('rbind', X)

# Pairwise Fusion strength hyperparameters (tau(k,k'))
# Same for all pairs in this example
G = matrix(1, k, k)

# Use L1 fusion to estimate betas (with near-optimal sparsity and
# information sharing among groups)
beta.estimate = fusedLassoProximal(X, y, groups, lambda=0.001, tol=9e-5,
                                   gamma=0.001, G, intercept=FALSE,
                                   num.it=2000)

test_that("L1 Fusion: Expect correlation between estimated and true beta.", {
  expect_gt(cor(c(beta.estimate), c(beta)), 0.9)
})

test_that("L1 Fusion: Expect small RMSE between estimated and true beta.", {
  expect_lt(mean((c(beta.estimate)-c(beta))^2), 0.01)
})

# Generate block diagonal matrices for L2 fusion approach
transformed.data = generateBlockDiagonalMatrices(X, y, groups, G)

# Use L2 fusion to estimate betas (with near-optimal information sharing among groups)
beta.estimate = fusedL2DescentGLMNet(transformed.data$X, transformed.data$X.fused,
                                     transformed.data$Y, groups, lambda=c(0,1e-4,1e-3,1e-2),
                                     gamma=1e-3)


test_that("L2 Fusion: Expect correlation between estimated and true beta.", {
  expect_gt(cor(c(beta.estimate[,,2]), c(beta)), 0.9)
})

test_that("L2 Fusion: Expect small RMSE between estimated and true beta.", {
  expect_lt(mean((c(beta.estimate[,,2])-c(beta))^2), 0.005)
})


