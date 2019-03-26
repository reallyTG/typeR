library(LatticeKrig)


### Name: Spatial models for data on spherical regions. 
### Title: Geometries to represent 2-d and 3-d spherical data.
### Aliases: LKRing LKCylinder LKSphere
### Keywords: spatial

### ** Examples

# 	
# fit the CO2 satellite data with a fixed lambda
# (use a very small and unrealistic number of basis functions and levels so example
#  runs quickly)
 data(CO2)
# to look at raw data: quilt.plot(CO2$lon.lat, CO2$y, nx=288, ny=165)
# NOTE: NC=1 is related to how grid for sphere is set up.
  LKinfo0<- LKrigSetup( CO2$lon.lat, NC=1 ,nlevel=2,
                       a.wght=6.1, alpha=c(1,.25),
                       LKGeometry="LKSphere" )                                         
  # Use MLE for lambda found below 
  obj0<- LKrig( CO2$lon.lat,CO2$y,LKinfo=LKinfo0, lambda=0.01068)
  surface(obj0, nx=288, ny=165)
  world( add=TRUE)
## Not run: 
##D # estimate lambda ( should be 0.01068)
##D obj0B<-  LatticeKrig( CO2$lon.lat,CO2$y,LKinfo=LKinfo0)
##D # a more serious model this uses about 3300 basis functions
##D LKinfo0<- LKrigSetup( CO2$lon.lat, NC=3 ,nlevel=3,
##D                        a.wght=6.1, alpha=c(1, .5, .25),
##D                        LKGeometry="LKSphere" )
##D                        
##D obj0B<-  LatticeKrig( CO2$lon.lat,CO2$y,LKinfo=LKinfo0)
##D # takes about 1 minute on a macbook air
##D # setting findAwght = TRUE  takes about 8 minutes with 
##D # lambda = 1.737 and a.wght = 15.8 (independence among basis coefficients)
## End(Not run) 
# a more serious model 
## Not run: 
##D   LKinfo1<- LKrigSetup(CO2$lon.lat, NC=8 ,nlevel=1, lambda=.2,
##D                        a.wght=5, alpha=1, 
##D                        LKGeometry="LKRing" )                                         
##D   obj1<- LatticeKrig( CO2$lon.lat,CO2$y,LKinfo=LKinfo1)	
##D # take a look: 
##D surface( obj1)
##D world( add=TRUE) 
## End(Not run)
# compare to fitting without wrapping
#  LKinfo2<- LKrigSetup(CO2$lon.lat, NC=8 ,nlevel=1,
#                   lambda=.2, a.wght=5, alpha=1 )                                         
#  obj2<- LKrig( CO2$lon.lat,CO2$y,LKinfo=LKinfo2)	
# not periodic in longitude:
# surface(obj2)  

# a synthetic example and larger example
## Not run: 
##D  set.seed(124)
##D  N<- 1e4
##D  NC<- 3
##D   x0<- matrix( rnorm(3*N), ncol=3)
##D   x0<- x0/ sqrt( rowSums( x0^2))
##D   
##D   x<-  toSphere( x0 )
##D   
##D   # the true function for testing -- a bump at the direction alpha
##D   fun<- function(X){
##D     alpha<-  c( .4,.2,1)
##D     alpha<- alpha/ sqrt( sum( alpha^2))
##D     4*( 1 + c(( X)%*%alpha) )^2 
##D   }
##D   
##D   ytrue <- fun(x0)
##D   y<- ytrue + .05*rnorm( length(ytrue))
##D   xr=cbind( c(-180, 180), c(-90,90))
##D   # this defines about 3300 basis functions
##D   LKinfo1<- LKrigSetup( xr,
##D                         NC=NC, LKGeometry="LKSphere", a.wght=1.01,
##D                         nlevel=3, alpha = c(1.0,.5,.25)^2,
##D                         choleskyMemory=list(nnzR= 20E6),
##D                         normalize=FALSE)
##D   out<- LatticeKrig( x,y, LKinfo=LKinfo1)                      
##D surface( out)                        
## End(Not run)




