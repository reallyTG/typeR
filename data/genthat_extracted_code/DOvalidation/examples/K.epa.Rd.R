library(DOvalidation)


### Name: K.epa
### Title: Epanechnikov Kernel
### Aliases: K.epa
### Keywords: distribution

### ** Examples

curve(K.epa,-1.5,1.5,main="Epanechnikov kernel",ylab="K(u)",xlab="u")
# The left onesided 
K.epa.left<-function(u) return(2*K.epa(u)*(u<0))
curve(K.epa.left,-1.5,1.5,main="Left onesided Epanechnikov kernel",ylab="K(u)",xlab="u")



