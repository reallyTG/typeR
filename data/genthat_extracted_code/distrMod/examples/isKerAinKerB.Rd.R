library(distrMod)


### Name: isKerAinKerB
### Title: isKerAinKerB
### Aliases: isKerAinKerB
### Keywords: algebra array

### ** Examples

ma <- cbind(1,1,c(1,1,7))
D <- t(ma %*% c(0,1,-1))
isKerAinKerB(D,ma)
isKerAinKerB(ma,D)



