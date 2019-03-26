library(multipol)


### Name: Ops.multipol
### Title: Arithmetic ops group methods for multipols
### Aliases: Ops.multipol mprod mplus mneg mps mpow
### Keywords: array

### ** Examples

a <- as.multipol(matrix(1,4,5))
100+a

f <- as.function(a+1i)
f(5:6)


b <- as.multipol(array(rnorm(12),c(2,3,2)))

f1 <- as.function(b)
f2 <- as.function(b*b)
f3 <- as.function(b^3)    # could have said b*b*b

x <- c(1,pi,exp(1))

f1(x)^2 - f2(x)    #should be zero
f1(x)^3 - f3(x)    #should be zero

x1 <- as.multipol(matrix(1:10,ncol=2))
x2 <- as.multipol(matrix(1:10,nrow=2))
x1+x2




