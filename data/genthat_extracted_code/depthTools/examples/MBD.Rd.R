library(depthTools)


### Name: MBD
### Title: Computation of the Modified Band Depth
### Aliases: MBD
### Keywords: multivariate

### ** Examples

## MBD of all elements within a sample
  
  ## simulated data
  set.seed(0)
  x <- matrix(rnorm(1000),100,10)
  x.depths.1<-MBD(x,plotting=TRUE)
 
  ## real data
  data(prostate)
  prost.x<-prostate[,1:100]
  prost.y<-prostate[,101]
  normal.depths<-MBD(prost.x[prost.y==0,],plotting=TRUE,
                     main="Normal samples")  
  tumor.depths<-MBD(prost.x[prost.y==1,],plotting=TRUE, band=TRUE,
                    band.limits=c(.33,.67,1),grayscale=TRUE)



## MBD of a vector with respect to a set of observations

  ## simulated data
  set.seed(0)
  v <- matrix(c(2,1,0,3,-2,1,2,1,0,-2,rnorm(3)),3,5)
  xR <- matrix(rnorm(100),10,5)
  depths<-MBD(v,xR,plotting=TRUE)

  # MBD of normal prostate samples with respect to tumoral ones
  normal.depths<-MBD(prost.x[prost.y==0,],prost.x[prost.y==1,],
                     plotting=TRUE)
  normal.depths<-MBD(prost.x[prost.y==0,],prost.x[prost.y==1,],plotting=TRUE, 
                    band=TRUE,band.limits=c(.33,.67,1),grayscale=TRUE)




