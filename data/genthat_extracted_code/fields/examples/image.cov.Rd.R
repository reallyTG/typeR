library(fields)


### Name: image.cov
### Title: Exponential, Matern and general covariance functions for 2-d
###   gridded locations.
### Aliases: stationary.image.cov Exp.image.cov Rad.image.cov
###   wendland.image.cov matern.image.cov
### Keywords: spatial

### ** Examples

# multiply 2-d isotropic exponential with theta=4 by a random vector 

junk<- matrix(rnorm(100*100), 100,100)

cov.obj<- stationary.image.cov( setup=TRUE, 
             grid=list(x=1:100,y=1:100),theta=8) 
result<-  stationary.image.cov(Y=junk,cov.obj=cov.obj)

image( matrix( result, 100,100)) # NOTE that is also a smoother!

# to do it again, no setup is needed 
#  e.g. 
#  junk2<- matrix(rnorm(100**2, 100,100))
#  result2<-  stationary.image.cov(Y=junk2, cov.obj=cov.obj)

# generate a grid and set of indices based on discretizing the locations
# in the precip dataset

 out<-as.image( RMprecip$y, x= RMprecip$x)
 ind1<- out$ind
 grid<- list( x= out$x, y=out$y)

#
# discretized x locations  to use for comparison
  xd<- cbind( out$x[ out$ind[,1]], out$y[ out$ind[,2]] )

# setup to create cov.obj for exponential covariance with range= 1.25

 cov.obj<- stationary.image.cov( setup=TRUE, grid=grid, theta=1.25) 

# multiply covariance matrix by an arbitrary vector
 junk<-  rnorm(nrow( ind1))
 result<- stationary.image.cov( ind1, ind1, Y= junk,cov.obj=cov.obj)

# The brute force way would be  
#   result<- stationary.cov( xd, xd, theta=1.25, C=junk)
# or 
#   result<- stationary.cov( xd, xd, theta=1.25) %*% junk
# both of these take much longer 


# evaluate the covariance between all grid points and the center grid point
 Y<- matrix(0,cov.obj$m, cov.obj$n)
 Y[32,32]<- 1
 result<- stationary.image.cov( Y= Y,cov.obj=cov.obj)
# covariance surface with respect to the grid point at (32,32)
# 
# reshape "vector" as an image
 temp<-  matrix( result, cov.obj$m,cov.obj$n)
 image.plot(cov.obj$grid$x,cov.obj$grid$y, temp)
# or persp( cov.obj$grid$x,cov.obj$grid$y, temp) 

# check out the Matern
 grid<- list( x= seq(-105,-99,,64), y= seq( 40,45,,64)) 
 cov.obj<- matern.image.cov( 
             setup=TRUE, grid=grid, theta=.55, smoothness=1.0)
 Y<- matrix(0,64,64)
 Y[16,16]<- 1

 result<- matern.image.cov( Y= Y,cov.obj=cov.obj)
  temp<-  matrix( result, cov.obj$m,cov.obj$n)
 image.plot( cov.obj$grid$x,cov.obj$grid$y, temp)

# Note we have centered at the location (grid$x[16],grid$y[16]) for this case
#  using sim.rf to simulate an Matern field
  look<- sim.rf( cov.obj)
  image.plot( grid$x, grid$y, look)





