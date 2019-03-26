library(hdi)


### Name: stability
### Title: Function to perform stability selection
### Aliases: stability
### Keywords: models regression

### ** Examples

x <- matrix(rnorm(100*1000), nrow = 100, ncol = 1000)
y <- x[,1] * 2 + x[,2] * 2.5 + rnorm(100)
fit.stab <- stability(x, y, EV = 1)
fit.stab
fit.stab$freq[1:10] ## selection frequency of the first 10 predictors



