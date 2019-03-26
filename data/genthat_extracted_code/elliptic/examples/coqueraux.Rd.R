library(elliptic)


### Name: coqueraux
### Title: Fast, conceptually simple, iterative scheme for Weierstrass P
###   functions
### Aliases: coqueraux
### Keywords: math

### ** Examples

 z <- seq(from=1+1i,to=30-10i,len=55)
 p <- P(z,c(0,1))
 c.true <- coqueraux(z,c(0,1),use.fpp=TRUE)
 c.false <- coqueraux(z,c(0,1),use.fpp=FALSE)
 plot(1:55,abs(p-c.false))
 points(1:55,abs(p-c.true),pch=16)
 



