library(Dowd)


### Name: VarianceCovarianceVaR
### Title: Variance-covariance VaR for normally distributed returns
### Aliases: VarianceCovarianceVaR

### ** Examples

# Variance-covariance VaR for randomly generated portfolio
   vc.matrix <- matrix(rnorm(16),4,4)
   mu <- rnorm(4)
   positions <- c(5,2,6,10)
   cl <- .95
   hp <- 280
   VarianceCovarianceVaR(vc.matrix, mu, positions, cl, hp)



