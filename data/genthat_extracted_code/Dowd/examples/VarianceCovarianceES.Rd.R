library(Dowd)


### Name: VarianceCovarianceES
### Title: Variance-covariance ES for normally distributed returns
### Aliases: VarianceCovarianceES

### ** Examples

# Variance-covariance ES for randomly generated portfolio
   vc.matrix <- matrix(rnorm(16), 4, 4)
   mu <- rnorm(4)
   positions <- c(5, 2, 6, 10)
   cl <- .95
   hp <- 280
   VarianceCovarianceES(vc.matrix, mu, positions, cl, hp)



