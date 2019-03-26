library(LambertW)


### Name: get_input
### Title: Back-transform Y to X
### Aliases: get.input get_input
### Keywords: manip

### ** Examples


set.seed(12)
# unskew very skewed data
y <- rLambertW(n = 1000, theta = list(beta = c(0, 1), gamma = 0.3), 
               distname = "normal")
test_normality(y)
fit.gmm <- IGMM(y, type="s")

x <- get_input(y, fit.gmm$tau)
# the same as
x <- get_input(fit.gmm)
test_normality(x) # symmetric Gaussian




