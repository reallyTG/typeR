library(Rwave)


### Name: DOG
### Title: Continuous Wavelet Transform with derivative of Gaussian
### Aliases: DOG
### Keywords: ts

### ** Examples

 x <- 1:512
    chirp <- sin(2*pi * (x + 0.002 * (x-256)^2 ) / 16)
  
 DOG(chirp, noctave=5, nvoice=12, 3, twoD=TRUE, plot=TRUE)





