library(serrsBayes)


### Name: weightedGaussian
### Title: Compute the spectral signature using Gaussian peaks.
### Aliases: weightedGaussian

### ** Examples

  Cal_V <- seq(300,400,by=5)
  loc <- c(320,350,375)
  sca <- c(10,5,18)
  amp <- c(1000,5000,2000)
  weightedGaussian(loc,sca,amp,Cal_V)



