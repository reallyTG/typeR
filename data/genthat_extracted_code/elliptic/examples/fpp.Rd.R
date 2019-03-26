library(elliptic)


### Name: fpp
### Title: Fundamental period parallelogram
### Aliases: fpp mn
### Keywords: math

### ** Examples

p <- c(1.01+1.123i, 1.1+1.43i)
mn(z=1:10,p) %*% p  ## should be close to 1:10

 #Now specify some periods:
 p2 <- c(1+1i,1-1i)

 #Define a sequence of complex numbers that zooms off to infinity:
 u <- seq(from=0,by=pi+1i*exp(1),len=2007)

 #and plot the sequence, modulo the periods:
 plot(fpp(z=u,p=p2))

 #and check that the resulting points are within the qpp:
polygon(c(-1,0,1,0),c(0,1,0,-1))
 




