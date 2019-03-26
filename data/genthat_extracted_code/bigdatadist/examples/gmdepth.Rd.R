library(bigdatadist)


### Name: gmdepth
### Title: Generalized Mahalanobis Depth and Distance
### Aliases: gmdepth
### Keywords: Generalized Mahalanobis depth and distance.

### ** Examples

require(MASS)
set.seed(1)
A=mvrnorm(450,c(0,0),Sigma=diag(2))
b=mvrnorm(50,c(10,10),Sigma=diag(c(0.1,0.1)))
C=rbind(A,b)
plot(C, pch=20, col=c(rep('black',450),rep('red',50)),
                      xlab='x1',ylab='x2')
## No test: 
gmd.fit = gmdepth(A=C)
depth    = gmd.fit$depth
distance = gmd.fit$distance
plot(depth,distance, pch=20, 
           col=c(rep('black',450),rep('red',50)))
gmdepth(A=A,b=mvrnorm(1,c(0,0),Sigma=diag(2))) 
## End(No test)



