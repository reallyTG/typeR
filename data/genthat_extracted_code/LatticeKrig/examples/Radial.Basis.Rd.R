library(LatticeKrig)


### Name: Radial.basis
### Title: Two dimensional radial and tensor basis functions based on a
###   Wendland function.
### Aliases: Radial.basis LKrig.cyl WendlandFunction Tensor.basis triWeight
### Keywords: spatial

### ** Examples

set.seed(12)
x<- cbind( runif(100), runif(100))
center<- expand.grid( seq( 0,1,,5), seq(0,1,,5))
# coerce to matrix
center<- as.matrix(center)

  PHI1<- Radial.basis(x, center, basis.delta = .5)
  PHI2<- Tensor.basis( x, center, basis.delta = .5 )
# similarity of radial and tensor product forms  
  plot( c(0,1.1), c(0,1.1), type="p")
  for( k in 1:25){
	points( PHI1[,k], PHI2[,k])
	}
	
# LKrig with a different radial basis function. 
# 
  data(ozone2)  
  x<-ozone2$lon.lat
  y<- ozone2$y[16,]
# Find location that are not 'NA'.
# (LKrig is not set up to handle missing observations.)
  good <-  !is.na( y)
  x<- x[good,]
  y<- y[good]
  obj<- LKrig(x,y,NC=30,nlevel=1, alpha=1, lambda=.01, a.wght=5)
    
  obj1<- LKrig(x,y,NC=30,nlevel=1, alpha=1, 
    lambda=.01, a.wght=5, BasisFunction="triWeight", overlap=1.8)



