library(serrsBayes)


### Name: weightedLorentzian
### Title: Compute the spectral signature using Lorentzian peaks.
### Aliases: weightedLorentzian

### ** Examples

  Cal_V <- seq(300,400,by=5)
  loc <- c(320,350,375)
  sca <- c(10,5,18)
  amp <- c(1000,5000,2000)
  weightedLorentzian(loc,sca,amp,Cal_V)



