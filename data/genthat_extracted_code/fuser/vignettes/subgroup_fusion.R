## ------------------------------------------------------------------------
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

# Generate test dataset
X.test = lapply(1:k, function(k.i) matrix(rnorm(n.group*p),n.group, p)) # covariates 
y.test = sapply(1:k, function(k.i) X.test[[k.i]] %*% beta[,k.i] + rnorm(n.group, 0, sigma)) # response

## ------------------------------------------------------------------------
library(fuser)
library(ggplot2)

# Pairwise Fusion strength hyperparameters (tau(k,k'))
# Same for all pairs in this example
G = matrix(1, k, k) 

# Use L1 fusion to estimate betas (with near-optimal sparsity and 
# information sharing among groups)
beta.estimate = fusedLassoProximal(X, y, groups, lambda=0.001, tol=9e-5, 
                                   gamma=0.001, G, intercept=FALSE,
                                   num.it=2000) 

## ----eval=FALSE----------------------------------------------------------
#  beta.estimate = fusedLassoProximal(X, y, groups, lambda=0.001, tol=9e-5,
#                                     gamma=0.001, G, intercept=FALSE,
#                                     num.it=2000, c.flag=TRUE)

## ---- fig.align='center', fig.width=5------------------------------------
plotting.frame = data.frame(Beta.True=c(beta),
                            Beta.Estimate=c(beta.estimate),
                            Group=factor(rep(1:k, each=p)))

correlation = round(cor(c(beta.estimate), c(beta)), digits=2)


ggplot(plotting.frame, aes(x=Beta.True, y=Beta.Estimate, colour=Group)) +
  geom_point() +
  annotate('text', x=0.5,y=1, label=paste('Pearson Cor.:', correlation))


## ------------------------------------------------------------------------
# Predict response based on estimated betas
y.predict = sapply(1:k, function(k.i) X.test[[k.i]] %*% beta.estimate[,k.i]) 

## ---- fig.align='center', fig.width=5------------------------------------
plotting.frame = data.frame(Y.Test=c(y.test),
                            Y.Predict=c(y.predict),
                            Group=factor(rep(1:k, each=n.group)))

correlation = round(cor(c(y.test), c(y.predict)), digits=2)


ggplot(plotting.frame, aes(x=Y.Test, y=Y.Predict, colour=Group)) +
  geom_point() +
  annotate('text', x=0.5,y=2.35, label=paste('Pearson Cor.:', correlation))


## ------------------------------------------------------------------------
# Generate block diagonal matrices for L2 fusion approach
transformed.data = generateBlockDiagonalMatrices(X, y, groups, G)

# Use L2 fusion to estimate betas (with near-optimal information sharing among groups)
beta.estimate = fusedL2DescentGLMNet(transformed.data$X, transformed.data$X.fused, 
                                     transformed.data$Y, groups, lambda=c(0,0.001,0.1,1),
                                     gamma=0.001)

# Returns a beta matrix for each lambda value, so we extract the one we think is optimal.
beta.estimate = beta.estimate[,,2]

## ---- fig.align='center', fig.width=5------------------------------------
plotting.frame = data.frame(Beta.True=c(beta),
                            Beta.Estimate=c(beta.estimate),
                            Group=factor(rep(1:k, each=p)))

correlation = round(cor(c(beta.estimate), c(beta)), digits=2)


ggplot(plotting.frame, aes(x=Beta.True, y=Beta.Estimate, colour=Group)) +
  geom_point() +
  annotate('text', x=0.5,y=1, label=paste('Pearson Cor.:', correlation))


## ------------------------------------------------------------------------
# Predict response based on estimated betas
y.predict = sapply(1:k, function(k.i) X.test[[k.i]] %*% beta.estimate[,k.i]) 

## ---- fig.align='center', fig.width=5------------------------------------
plotting.frame = data.frame(Y.Test=c(y.test),
                            Y.Predict=c(y.predict),
                            Group=factor(rep(1:k, each=n.group)))

correlation = round(cor(c(y.test), c(y.predict)), digits=2)

ggplot(plotting.frame, aes(x=Y.Test, y=Y.Predict, colour=Group)) +
  geom_point() +
  annotate('text', x=0.5,y=2.5, label=paste('Pearson Cor.:', correlation))


