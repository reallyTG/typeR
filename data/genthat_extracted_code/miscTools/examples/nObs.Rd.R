library(miscTools)


### Name: nObs
### Title: Return number of observations for statistical models
### Aliases: nObs nObs.default nObs.lm
### Keywords: methods

### ** Examples

# Construct a simple OLS regression:
x1 <- runif(100)
x2 <- runif(100)
y <- 3 + 4*x1 + 5*x2 + rnorm(100)
m <- lm(y~x1+x2)  # estimate it
nObs(m)



