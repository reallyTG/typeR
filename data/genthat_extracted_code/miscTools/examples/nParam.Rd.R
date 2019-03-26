library(miscTools)


### Name: nParam
### Title: Number of model parameters
### Aliases: nParam nParam.default nParam.lm
### Keywords: methods

### ** Examples

# Construct a simple OLS regression:
x1 <- runif(100)
x2 <- runif(100)
y <- 3 + 4*x1 + 5*x2 + rnorm(100)
m <- lm(y~x1+x2)  # estimate it
summary(m)
nParam(m) # you get 3



