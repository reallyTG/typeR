library(DOvalidation)


### Name: K.sextic
### Title: Sextic Kernel
### Aliases: K.sextic
### Keywords: distribution

### ** Examples

curve(K.sextic,-1.5,1.5,main="Sextic kernel",ylab="K(u)",xlab="u")
# The left onesided 
K.sextic.left<-function(u) return(2*K.sextic(u)*(u<0))
curve(K.sextic.left,-1.5,1.5,main="Left onesided sextic kernel",ylab="K(u)",xlab="u")



