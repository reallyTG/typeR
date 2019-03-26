library(fields)


### Name: predict.Krig
### Title: Evaluation of Krig spatial process estimate.
### Aliases: predict.Krig predict.Tps predictDerivative.Krig
###   predict.fastTps
### Keywords: spatial

### ** Examples

  Krig(ChicagoO3$x,ChicagoO3$y, theta=50) ->fit
  predict( fit) # gives predicted values at data points should agree with fitted.values
                #  in fit object 

# predict at the coordinate (-5,10)
  x0<- cbind( -5,10) # has to be a  1X2 matrix
  predict( fit,x= x0)

# redoing predictions at data locations:
   predict( fit, x=ChicagoO3$x)

# only the fixed part of the model
  predict( fit, just.fixed=TRUE) 

# evaluating estimate at a grid of points 
  grid<- make.surface.grid( list( seq( -40,40,,15), seq( -40,40,,15)))
  look<- predict(fit,grid) # evaluate on a grid of points

# some useful graphing functions for these gridded predicted values
  out.p<- as.surface( grid, look) # reformat into $x $y $z image-type object
  contour( out.p) 

# see also the functions predictSurface and surface 
# for functions that combine these steps 
   

# refit with 10 degrees of freedom in surface
  look<- predict(fit,grid, df=15)
# refit with random data 
  look<- predict( fit, grid, y= rnorm( 20))


# finding partial derivatives of the estimate
#
# find the partial derivatives at observation locations
# returned object is a two column matrix. 
# this does not make sense for the exponential covariance
# but can illustrate this with a thin plate spline with
# a high enough order ( i.e. need m=3 or greater)
# 
  data(ozone2)
# the 16th day of this ozone spatial dataset
  fit0<- Tps( ozone2$lon.lat, ozone2$y[16,], m=3)
  look1<- predictDerivative.Krig( fit0)
# for extra credit compare this to
  look2<- predictDerivative.Krig( fit0, x=ozone2$lon.lat)  
# (why are there more values in look2) 





