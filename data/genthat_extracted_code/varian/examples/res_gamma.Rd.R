library(varian)


### Name: res_gamma
### Title: Estimates the parameters of a Gamma distribution from SDs
### Aliases: res_gamma
### Keywords: utilities

### ** Examples

set.seed(1234)
y <- rgamma(100, 3, 2)
x <- rnorm(100 * 10, mean = 0, sd = rep(y, each = 10))
ID <- rep(1:100, each = 10)
res_gamma(x, ID)



