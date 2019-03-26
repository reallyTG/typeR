library(serrsBayes)


### Name: mixedVoigt
### Title: Compute the spectral signature using Voigt peaks.
### Aliases: mixedVoigt

### ** Examples

  Cal_V <- seq(300,400,by=5)
  loc <- c(320,350,375)
  scG <- c(10,5,1)
  scL <- c(3,20,7)
  amp <- c(100,500,200)
  mixedVoigt(loc,scG,scL,amp,Cal_V)



