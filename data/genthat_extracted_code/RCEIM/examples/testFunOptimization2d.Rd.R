library(RCEIM)


### Name: testFunOptimization2d
### Title: 2D test problem for RCEIM
### Aliases: testFunOptimization2d
### Keywords: misc design

### ** Examples

# Create a graphical representation of the problem with a contour plot
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
rm(list=c('xx','yy','zz'))



