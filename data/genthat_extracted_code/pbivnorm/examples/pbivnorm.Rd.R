library(pbivnorm)


### Name: pbivnorm
### Title: Standard bivariate normal CDF
### Aliases: pbivnorm

### ** Examples

x <- rnorm(10)
y <- rnorm(10)
rho <- runif(10)

pbivnorm(x, y, rho)

X <- cbind(x, y)
pbivnorm(X, rho = rho)

## rho can be a single value, unless recycling is disallowed
rho <- runif(1)
pbivnorm(x, y, rho)



