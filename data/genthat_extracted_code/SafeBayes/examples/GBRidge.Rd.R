library(SafeBayes)


### Name: GBRidge
### Title: Generalized Bayesian Ridge Regression
### Aliases: GBRidge
### Keywords: SafeBayes

### ** Examples

rm(list=ls())
library(SafeBayes)

# Simulate data
x <- runif(100, -1, 1) # 100 random uniform x's between -1 and 1
y <- NULL

# for each x, a y that is 0 + Gaussian noise
for (i in 1:100) {
  y[i] <-  0 + rnorm(1, mean=0, sd=1/4) 
  }
  
# Now sample 100 zero's and ones (coin toss)
cointoss <- sample(0:1, 100, replace=TRUE)
# indices of the ones
indices <- which(cointoss==1)

# we replace x and y with (0,0) for the indices the cointoss 
# landed tail (1)
x[indices] <- 0
y[indices] <- 0

plot(x,y)

# Determine the generalized posterior for eta = 0.25
obj <- GBLasso(y, x, eta=0.25)

# posterior means of the coefficients beta and intercept mu
betafour <- obj$bL
mufour <- obj$mu



