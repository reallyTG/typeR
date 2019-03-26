library(metafuse)


### Name: datagenerator
### Title: simulate data
### Aliases: datagenerator
### Keywords: data generator

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
names(data)

# if family="cox", returned dataset contains columns "time"" and "status" instead of "y"
data <- datagenerator(n=n, beta0=beta0, family="cox", seed=123)
names(data)



