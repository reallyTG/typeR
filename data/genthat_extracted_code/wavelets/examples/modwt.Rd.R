library(wavelets)


### Name: modwt
### Title: Maximal Overlap Discrete Wavelet Transform
### Aliases: modwt print.modwt summary.modwt
### Keywords: ts

### ** Examples

# obtain the two series listed in Percival and Walden (2000), page 42
X1 <- c(.2,-.4,-.6,-.5,-.8,-.4,-.9,0,-.2,.1,-.1,.1,.7,.9,0,.3)
X2 <- c(.2,-.4,-.6,-.5,-.8,-.4,-.9,0,-.2,.1,-.1,.1,-.7,.9,0,.3)

# combine them and compute DWT
newX <- cbind(X1,X2)
wt <- dwt(newX, n.level=3, boundary="reflection", fast=FALSE)



