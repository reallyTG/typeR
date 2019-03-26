library(MAVE)


### Name: mave
### Title: Dimension reduction
### Aliases: mave mave.compute

### ** Examples

 x <- matrix(rnorm(400*5),400,5)
 b1 <- matrix(c(1,1,0,0,0),5,1)
 b2 <- matrix(c(0,0,1,1,0),5,1)
 eps <- matrix(rnorm(400),400,1)
 y <- x%*%b1 + (x%*%b2)*eps

 #finding central space based on OPG method
 #dr.csopg <- mave.compute(x,y, method = 'csopg')
 #or
 dr.csopg <- mave(y ~ x, method = 'csopg')

 #dr.meanopg <- mave.compute(x,y, method = 'meanopg')
 #or
 dr.meanopg <- mave(y ~ x, method = 'meanopg')

 #find central mean space based on ksir method
 dr.ksir <- mave(y~x,method='ksir')
 #or
 #dr.ksir <- mave.compute(x,y,method='ksir')

 #See more examples about screening and mutiple responses in the vignette
 #Using screening for high dimensional data
 #x <- matrix(rnorm(100*50),100,50)
 #y1 = as.matrix(x[,1])+rnorm(100)*.2
 #y2 = as.matrix(x[,2]+x[,3])*as.matrix(x[,1]+x[,5])+rnorm(100)*.2
 #y = cbind(y1,y2)
 #dr.sc = mave(y~x,method='CSOPG',max.dim=5,screen=20)
 #dr.sc.dim = mave.dim(dr.sc)
 #print the directions of central space with the selected variables
 #dr.sc.dim$dir[[3]][dr.sc$idx,]




