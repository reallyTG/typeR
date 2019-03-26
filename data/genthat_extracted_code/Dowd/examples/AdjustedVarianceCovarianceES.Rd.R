library(Dowd)


### Name: AdjustedVarianceCovarianceES
### Title: Cornish-Fisher adjusted Variance-Covariance ES
### Aliases: AdjustedVarianceCovarianceES

### ** Examples

# Variance-covariance ES for randomly generated portfolio
   vc.matrix <- matrix(rnorm(16), 4, 4)
   mu <- rnorm(4)
   skew <- .5
   kurtosis <- 1.2
   positions <- c(5, 2, 6, 10)
   cl <- .95
   hp <- 280
   AdjustedVarianceCovarianceES(vc.matrix, mu, skew, kurtosis, positions, cl, hp)



