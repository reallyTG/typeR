library(hdi)


### Name: lm.ci
### Title: Function to calculate confidence intervals for ordinary multiple
###   linear regression.
### Aliases: lm.ci
### Keywords: models regression

### ** Examples

x <- matrix(rnorm(100*5), nrow = 100, ncol = 5)
y <- x[,1] * 2 + x[,2] * 2.5 + rnorm(100)
ci <- lm.ci(x, y)
ci



