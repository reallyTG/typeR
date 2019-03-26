library(RCEIM)


### Name: RCEIM-package
### Title: An R Cross Entropy Inspired Method for Optimization RCEIM
### Aliases: RCEIM-package RCEIM
### Keywords: package optimize

### ** Examples

# Solve a simple optimization problem and shows the results
po <- ceimOpt(OptimFunction=function(x){(x[1]+1)^2+(x[2]+2)^2}, maxIter=100, epsilon=0.3, 
      nParams=2)
plotEliteDistrib(po$EliteMembers)
rm(po)

# A harder problem in 1D
po <- ceimOpt(OptimFunction="testFunOptimization", maxIter=10, epsilon=0.3, 
      nParams=1, verbose=TRUE)
dev.new()
xx <- seq(-10,10,by=0.01)
plot(xx, testFunOptimization(xx), type="l", xlab="x", ylab="Value")
points(po$BestMember[1], po$BestMember[2], col="red")
rm(list=c('xx','po'))

# A harder problem in 2D
po <- ceimOpt(OptimFunction="testFunOptimization2d", maxIter=20, epsilon=0.3, 
      nParams=2, verbose=TRUE)
dev.new()
xx <- seq(-10,10,by=0.1)
yy <- seq(-10,10,by=0.1)
zz <- matrix(nrow=length(yy), ncol=length(xx))
for(i in 1:length(xx)){
    for(j in 1:length(yy)){
        zz[i,j] <- testFunOptimization2d( c(xx[i],yy[j]) )
    }
}
image(xx,yy,zz, col=gray((50:100)/100), xlab="x", ylab="y")
contour(xx,yy,zz, add=TRUE)
points(po$BestMember[1], po$BestMember[2], col="red", pch=19, cex=0.5)
rm(list=c('xx','yy','zz'))

# Example of multicore processing
slowFunction <- function(x) { 
  p<-runif(50000)
  return((x+3)^2)
} 
system.time(po <- ceimOpt(OptimFunction="slowFunction", maxIter=10,
    Ntot=100, epsilon=0.3, nParams=1, verbose=FALSE, parallel=FALSE))
print(po$BestMember)
system.time(po <- ceimOpt(OptimFunction="slowFunction", maxIter=10,
    Ntot=100, epsilon=0.3, nParams=1, verbose=FALSE, parallel=TRUE))
print(po$BestMember)
rm(po)



