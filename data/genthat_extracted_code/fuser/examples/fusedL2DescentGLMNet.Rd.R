library(fuser)


### Name: fusedL2DescentGLMNet
### Title: Optimise the fused L2 model with glmnet (using transformed input
###   data)
### Aliases: fusedL2DescentGLMNet

### ** Examples


#' set.seed(123)

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

X = lapply(1:k,
           function(k.i) matrix(rnorm(n.group*p),
                                n.group, p)) # covariates
y = sapply(1:k,
           function(k.i) X[[k.i]] %*% beta[,k.i] +
                           rnorm(n.group, 0, sigma)) # response
X = do.call('rbind', X)

# Pairwise Fusion strength hyperparameters (tau(k,k'))
# Same for all pairs in this example
G = matrix(1, k, k)

# Generate block diagonal matrices
transformed.data = generateBlockDiagonalMatrices(X, y, groups, G)

# Use L2 fusion to estimate betas (with near-optimal information
# sharing among groups)
beta.estimate = fusedL2DescentGLMNet(transformed.data$X,
                                     transformed.data$X.fused,
                                     transformed.data$Y, groups,
                                     lambda=c(0,0.001,0.1,1),
                                     gamma=0.001)



