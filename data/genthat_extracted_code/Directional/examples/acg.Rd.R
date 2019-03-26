library(Directional)


### Name: MLE of the angular central Gaussian distribution
### Title: MLE of the angular central Gaussian distribution
### Aliases: acg
### Keywords: projected normal directional data

### ** Examples

m <- c(0, 0, 0, 0)
s <- cov(iris[, 1:4])
x <- MASS::mvrnorm(500, m, s)
x <- x / sqrt( Rfast::rowsums(x^2) )
mod <- acg(x)
mod
cov2cor(mod$cova)  ## estimated covariance matrix turned into a correlation matrix
cov2cor(s)  ## true covariance matrix turned into a correlation matrix



