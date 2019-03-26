library(metafuse)


### Name: metafuse.l
### Title: fit a GLM with fusion penalty for data integraion, with a fixed
###   lambda
### Aliases: metafuse.l

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
# fit metafuse at a given lambda
metafuse.l(X=X, y=y, sid=sid, fuse.which=c(0,1,2), family="gaussian", intercept=TRUE,
          alpha=1, lambda=0.5)



