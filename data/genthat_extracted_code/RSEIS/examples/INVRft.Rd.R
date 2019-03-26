library(RSEIS)


### Name: INVRft
### Title: Inverse Fourier Transform
### Aliases: INVRft
### Keywords: misc

### ** Examples

zil  <-  rnorm(300)
fss  <-  FRWDft( zil, length(zil), 0, 0.004)   
INVRft(fss$G, length(zil), 0, 0.004)





