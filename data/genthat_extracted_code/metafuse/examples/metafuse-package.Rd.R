library(metafuse)


### Name: metafuse-package
### Title: Fused Lasso Approach in Regression Coefficient Clustering
### Aliases: metafuse-package
### Keywords: Fused lasso Data integration Generalized Linear Models
###   package

### ** Examples

########### generate data ###########
n <- 200    # sample size in each dataset (can also be a K-element vector)
K <- 10     # number of datasets for data integration
p <- 3      # number of covariates in X (including the intercept)

# the coefficient matrix of dimension K * p, used to specify the heterogeneous pattern
beta0 <- matrix(c(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,   # beta_0 of intercept
                  0.0,0.0,0.0,0.0,0.0,1.0,1.0,1.0,1.0,1.0,   # beta_1 of X_1
                  0.0,0.0,0.0,0.0,0.5,0.5,0.5,1.0,1.0,1.0),  # beta_2 of X_2
                K, p)

# generate a data set, family=c("gaussian", "binomial", "poisson", "cox")
data <- datagenerator(n=n, beta0=beta0, family="gaussian", seed=123)

# prepare the input for metafuse
y       <- data$y
sid     <- data$group
X       <- data[,-c(1,ncol(data))]

########### run metafuse ###########
# fuse slopes of X1 (which is heterogeneous with 2 clusters)
metafuse(X=X, y=y, sid=sid, fuse.which=c(1), family="gaussian", intercept=TRUE, alpha=0,
          criterion="EBIC", verbose=TRUE, plots=TRUE, loglambda=TRUE)

# fuse slopes of X2 (which is heterogeneous with 3 clusters)
metafuse(X=X, y=y, sid=sid, fuse.which=c(2), family="gaussian", intercept=TRUE, alpha=0,
          criterion="EBIC", verbose=TRUE, plots=TRUE, loglambda=TRUE)

# fuse all three covariates
metafuse(X=X, y=y, sid=sid, fuse.which=c(0,1,2), family="gaussian", intercept=TRUE, alpha=0,
          criterion="EBIC", verbose=TRUE, plots=TRUE, loglambda=TRUE)

# fuse all three covariates, with sparsity penalty
metafuse(X=X, y=y, sid=sid, fuse.which=c(0,1,2), family="gaussian", intercept=TRUE, alpha=1,
          criterion="EBIC", verbose=TRUE, plots=TRUE, loglambda=TRUE)

# fit metafuse at a given lambda
metafuse.l(X=X, y=y, sid=sid, fuse.which=c(0,1,2), family="gaussian", intercept=TRUE,
          alpha=1, lambda=0.5)



