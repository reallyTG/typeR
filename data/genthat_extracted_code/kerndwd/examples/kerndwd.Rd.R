library(kerndwd)


### Name: kerndwd
### Title: solve Linear DWD and Kernel DWD
### Aliases: kerndwd
### Keywords: DWD kernel methods classification

### ** Examples

data(BUPA)
# standardize the predictors
BUPA$X = scale(BUPA$X, center=TRUE, scale=TRUE)

# a grid of tuning parameters
lambda = 10^(seq(3, -3, length.out=10))

# fit a linear DWD
kern = vanilladot()
DWD_linear = kerndwd(BUPA$X, BUPA$y, kern,
  qval=1, lambda=lambda, eps=1e-5, maxit=1e5)

# fit a DWD using Gaussian kernel
kern = rbfdot(sigma=1)
DWD_Gaussian = kerndwd(BUPA$X, BUPA$y, kern,
  qval=1, lambda=lambda, eps=1e-5, maxit=1e5)

# fit a weighted kernel DWD
kern = rbfdot(sigma=1)
weights = c(1, 2)[factor(BUPA$y)]
DWD_wtGaussian = kerndwd(BUPA$X, BUPA$y, kern,
  qval=1, lambda=lambda, wt = weights, eps=1e-5, maxit=1e5)



