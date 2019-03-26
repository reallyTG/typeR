library(fields)


### Name: Tps
### Title: Thin plate spline regression
### Aliases: Tps fastTps
### Keywords: smooth

### ** Examples

#2-d example 

fit<- Tps(ChicagoO3$x, ChicagoO3$y)  # fits a surface to ozone measurements. 

set.panel(2,2)
plot(fit) # four diagnostic plots of  fit and residuals. 
set.panel()

# summary of fit and estiamtes of lambda the smoothing parameter
summary(fit)

surface( fit) # Quick image/contour plot of GCV surface.

# NOTE: the predict function is quite flexible:

     look<- predict( fit, lambda=2.0)
#  evaluates the estimate at lambda =2.0  _not_ the GCV estimate
#  it does so very efficiently from the Krig fit object.

     look<- predict( fit, df=7.5)
#  evaluates the estimate at the lambda values such that 
#  the effective degrees of freedom is 7.5
 

# compare this to fitting a thin plate spline with 
# lambda chosen so that there are 7.5 effective 
# degrees of freedom in estimate
# Note that the GCV function is still computed and minimized
# but the lambda values used correpsonds to 7.5 df.

fit1<- Tps(ChicagoO3$x, ChicagoO3$y,df=7.5)

set.panel(2,2)
plot(fit1) # four diagnostic plots of  fit and residuals.
          # GCV function (lower left) has vertical line at 7.5 df.
set.panel()

# The basic matrix decompositions are the same for 
# both fit and fit1 objects. 

# predict( fit1) is the same as predict( fit, df=7.5)
# predict( fit1, lambda= fit$lambda) is the same as predict(fit) 


# predict onto a grid that matches the ranges of the data.  

out.p<-predictSurface( fit)
image( out.p) 

# the surface function (e.g. surface( fit))  essentially combines 
# the two steps above

# predict at different effective 
# number of parameters 
out.p<-predictSurface( fit,df=10)

## Not run: 
##D # predicting on a grid along with a covariate
##D   data( COmonthlyMet)	
##D # predicting average daily minimum temps for spring in Colorado
##D # NOTE to create an  4km  elevation grid: 
##D # data(PRISMelevation); CO.elev1 <- crop.image(PRISMelevation, CO.loc )
##D # then use same grid for the predictions: CO.Grid1<- CO.elev1[c("x","y")]
##D   obj<- Tps( CO.loc, CO.tmin.MAM.climate, Z= CO.elev)
##D   out.p<-predictSurface( obj,
##D             grid.list=CO.Grid, ZGrid= CO.elevGrid)
##D   image.plot( out.p)        
##D   US(add=TRUE, col="grey")
##D   contour( CO.elevGrid, add=TRUE, levels=c(2000), col="black")
## End(Not run)
## Not run: 
##D #A 1-d example  with confidence intervals
##D   out<-Tps( rat.diet$t, rat.diet$trt) # lambda found by GCV 
##D   out
##D   plot( out$x, out$y)
##D   xgrid<- seq(  min( out$x), max( out$x),,100)
##D   fhat<- predict( out,xgrid)
##D   lines( xgrid, fhat,)
##D   SE<- predictSE( out, xgrid)
##D   lines( xgrid,fhat + 1.96* SE, col="red", lty=2)
##D   lines(xgrid, fhat - 1.96*SE, col="red", lty=2)
##D 
##D # 
##D # compare to the ( much faster) B spline algorithm 
##D #  sreg(rat.diet$t, rat.diet$trt) 
##D 
##D # Here is a 1-d example with 95 percent  CIs  where sreg would not 
##D # work:
##D #  sreg would give the right estimate here but not the right CI's
##D   x<- seq( 0,1,,8)
##D   y<- sin(3*x)
##D   out<-Tps( x, y) # lambda found by GCV 
##D   plot( out$x, out$y)
##D   xgrid<- seq(  min( out$x), max( out$x),,100)
##D   fhat<- predict( out,xgrid)
##D   lines( xgrid, fhat, lwd=2)
##D   SE<- predictSE( out, xgrid)
##D   lines( xgrid,fhat + 1.96* SE, col="red", lty=2)
##D   lines(xgrid, fhat - 1.96*SE, col="red", lty=2)
## End(Not run)

# More involved example adding a covariate to the fixed part of model
## Not run: 
##D set.panel( 1,3)
##D # without elevation covariate
##D   out0<-Tps( RMprecip$x,RMprecip$y)
##D   surface( out0)
##D   US( add=TRUE, col="grey")
##D 
##D # with elevation covariate
##D   out<- Tps( RMprecip$x,RMprecip$y, Z=RMprecip$elev)
##D # NOTE: out$d[4] is the estimated elevation coefficient
##D # it is easy to get the smooth surface separate from the elevation.
##D   out.p<-predictSurface( out, drop.Z=TRUE)
##D   surface( out.p)
##D   US( add=TRUE, col="grey")
##D # and if the estimate is of high resolution and you get by with 
##D # a simple discretizing -- does not work in this case!
##D   quilt.plot( out$x, out$fitted.values)
##D #
##D # the exact way to do this is evaluate the estimate
##D # on a grid where you also have elevations 
##D # An elevation DEM from the PRISM climate data product (4km resolution)
##D   data(RMelevation)  
##D   grid.list<- list( x=RMelevation$x, y= RMelevation$y)
##D   fit.full<- predictSurface( out, grid.list, ZGrid= RMelevation)
##D # this is the linear fixed part of the second spatial model:
##D # lon,lat and elevation
##D   fit.fixed<- predictSurface( out, grid.list, just.fixed=TRUE, ZGrid= RMelevation)
##D # This is the smooth part but also with the linear lon lat terms. 
##D   fit.smooth<-predictSurface( out, grid.list, drop.Z=TRUE)
##D #
##D   set.panel( 3,1)
##D   
##D   fit0<- predictSurface( out0, grid.list)
##D   image.plot( fit0)
##D   title(" first spatial model (w/o elevation)")
##D   image.plot( fit.fixed)
##D   title(" fixed part of second model (lon,lat,elev linear model)")
##D   US( add=TRUE)
##D   image.plot( fit.full)
##D   title("full prediction second model")
##D   set.panel()
## End(Not run)
### 
### fast Tps
# m=2   p= 2m-d= 2
#
# Note: theta =3 degrees is a very generous taper range. 
# Use some trial theta value with rdist.nearest to determine a
# a useful taper. Some empirical studies suggest that in the 
# interpolation case in 2 d the taper should be large enough to 
# about 20 non zero nearest neighbors for every location.

  fastTps( RMprecip$x,RMprecip$y,m=2,lambda= 1e-2, theta=3.0) -> out2

# note that fastTps produces an mKrig object so one can use all the 
# the overloaded functions that are defined for the mKrig class. 
# summary of what happened note estimate of effective degrees of 
# freedom
  print( out2)

## Not run: 
##D set.panel( 1,2)
##D surface( out2)
##D 
##D #
##D # now use great circle distance for this smooth 
##D # Here "theta" for the taper support is the great circle distance in degrees latitude.
##D # Typically for data analysis it more convenient to think in degrees. A degree of
##D # latitude is about 68 miles (111 km).
##D #
##D fastTps( RMprecip$x,RMprecip$y,m=2,lambda= 1e-2,lon.lat=TRUE, theta= 3.0) -> out3
##D print( out3)  # note the effective degrees of freedom is different.
##D surface(out3)
##D 
##D set.panel()
## End(Not run)

## Not run: 
##D #
##D # simulation reusing Tps/Krig object
##D #
##D fit<- Tps( rat.diet$t, rat.diet$trt)
##D true<- fit$fitted.values
##D N<-  length( fit$y)
##D temp<- matrix(  NA, ncol=50, nrow=N)
##D sigma<- fit$shat.GCV
##D for (  k in 1:50){
##D ysim<- true + sigma* rnorm(N) 
##D temp[,k]<- predict(fit, y= ysim)
##D }
##D matplot( fit$x, temp, type="l")
##D 
## End(Not run)
# 
#4-d example 
fit<- Tps(BD[,1:4],BD$lnya,scale.type="range") 

# plots fitted surface and contours 
# default is to hold 3rd and 4th fixed at median values 

surface(fit)   






