library(LatticeKrig)


### Name: LKrig
### Title: Spatial prediction and inference using a compactly supported
###   multi-resolution basis and a lattice model for the basis
###   coefficients.
### Aliases: LKrig choleskyMemory predict.LKrig predictSE.LKrig print.LKrig
###   summary.LKrig print.LKinfo surface.LKrig predictSurface.LKrig
### Keywords: spatial

### ** Examples

# NOTE: CRAN requires that the "run" examples  execute within  5 seconds. 
# so to meet this constraint many of these have been 
# severely limited to be quick, typically making NC and nlevel
# very small.
	
# Load ozone data set
  data(ozone2)  
  x<-ozone2$lon.lat
  y<- ozone2$y[16,]
# Find location that are not 'NA'.
# (LKrig is not set up to handle missing observations.)
  good <-  !is.na( y)
  x<- x[good,]
  y<- y[good]

# fairly arbitrary choices for covariance parameters and lambda
# just to show a basic level call
  obj1<- LKrig( x,y, a.wght=5, nlevel=3, nu=1.0, NC=10, lambda=.1)
  print(obj1)
#  
# this is the same as:
#  LKinfoEX<- LKrigSetup( x, a.wght=5, nlevel=3, nu=1.0, NC=4)
#  obj1<- LKrig( x,y, LKinfo= LKinfoEX, lambda=.1)  

# thin plate spline-like model with the lambda parameter estimated by
# maximum likelihood. Default choices are made for a.wght, nlevel, NC
# and alpha.
## Not run: 
##D   obj<- LatticeKrig( x, y)
##D # summary of fit and a plot of fitted surface
##D   print( obj)
##D   surface( obj )
##D   US(add=TRUE)
##D   points(x)
##D # prediction standard errors
##D   out.se<- predictSE( obj, xnew= x)
## End(Not run)

# breaking down the LatticeKrig function into several steps. 
# also use a different covariance model that has fewer basis functions
# (to make the example run more quickly)

## Not run: 
##D  
##D   LKinfo<- LKrigSetup( x, nlevel=3, nu=1, NC=5, a.wght=5,
##D                         lambda=.01)
##D # maximize likelihood over lambda see help( LKrig.MLE) for details
##D # this assumes the value of 5 for a.wght.  In many cases the fit is not
##D # very sensitive to the range parameter such as a.wght in this case --
##D # but very sensitive to lambda when varied on a log scale.
##D 
##D   MLE.fit<- LKrig.MLE(x,y, LKinfo=LKinfo)
##D   MLE.fit$summary # summary of optimization over lambda.
##D # fit using MLE for lambda MLE function has added MLE value of lambda to
##D # the LKinfo object.
##D   obj<- LKrig( x,y, LKinfo=MLE.fit$LKinfo.MLE)  
##D   print( obj)  
##D # find prediction standard errors at locations based on fixing covariance
##D # at MLE's
##D   out.se<- predictSE( obj, xnew= x)
##D # one could evaluate the SE on a grid to get the surface of predicted SE's 
##D # for large grids it is better to use LKrig.sim.conditional to estimate
##D #  the variances by Monte Carlo
## End(Not run)

##########################################################################
# Use multiresolution model that approximates an exponential covariance
# Note that a.wght, related to a range/scale parameter
# is specified at a (seemingly) arbitrary value. 
##########################################################################
  
  LKinfo<- LKrigSetup( x, NC=4, nu=1, nlevel=2, a.wght= 5)
# take a look at the implied covariance function solid=along x
#  and  dashed=along y 
  check.cov<- LKrig.cov.plot( LKinfo)
  matplot( check.cov$d, check.cov$cov, type="l", lty=c(1,2))  

############################################################################
# Search over lambda to find MLE for ozone data with approximate exponential
# covariance
###########################################################################
## Not run: 
##D   LKinfo.temp<-  LKrigSetup( x, NC=6, nu=1,  nlevel=3, a.wght= 5, lambda=.5)
##D # starting value for lambda optimization 
##D   MLE.search<- LKrig.MLE(x,y, LKinfo=LKinfo.temp)
##D # this function returns an LKinfo object with the MLE for lambda included.
##D   MLE.ozone.fit<- LKrig( x,y,  LKinfo= MLE.search$LKinfo.MLE)
## End(Not run) 
###########################################################################
# Including a covariate (linear fixed part in spatial model)
##########################################################################

  data(COmonthlyMet)
  y.CO<- CO.tmin.MAM.climate
  good<- !is.na( y.CO)
  y.CO<-y.CO[good]
  x.CO<- as.matrix(CO.loc[good,])
  Z.CO<- CO.elev[good]
# single level with large range parameter -- similar to a thin plate spline
#  lambda specified 

# fit with elevation 
# note how for convenience the LKrig parameters are
# just included here and not passed as a separate LKinfo object. 
  obj.CO.elev<- LKrig( x.CO,y.CO,Z=Z.CO, nlevel=1, NC=50, alpha=1, lambda=.005,
                          a.wght=4.1)
# BTW the coefficient for the linear term for elevation  is obj.CO$d.coef[4]
# fitted surface without the elevation term
## Not run: 
##D    LKinfo<- LKrigSetup( x.CO, nlevel=1, NC=20,alpha=1, a.wght=4.1, lambda=1.0)
##D # lambda given here is just the starting value for MLE optimization
##D   CO.MLE<- LKrig.MLE( x.CO,y.CO,Z=Z.CO, LKinfo=LKinfo)
##D   obj.CO.elev<- LKrig( x.CO,y.CO,Z=Z.CO, LKinfo= CO.MLE$LKinfo.MLE)
##D   CO.surface2<- predictSurface( obj.CO.elev, drop.Z=TRUE, nx=50, ny=50)
##D # pull off CO elevations at same locations on grid as the surface
##D   data( RMelevation) 
##D # a superset of elevations at 4km resolution
##D   elev.surface<- interp.surface.grid( RMelevation, CO.surface2)
##D    CO.full<- predictSurface( obj.CO.elev, ZGrid= elev.surface, nx=50, ny=50)
##D    
##D # for comparison fit without elevation as a linear covariate:
##D   CO.MLE2<- LKrig.MLE( x.CO,y.CO, LKinfo=LKinfo)
##D   obj.CO<- LKrig( x.CO,y.CO, LKinfo= CO.MLE2$LKinfo.MLE)
##D # surface estimate
##D   CO.surface<- predictSurface( obj.CO, nx=50, ny=50)
##D   set.panel( 2,1)
##D   coltab<- topo.colors(256)
##D   zr<- range( c( CO.full$z), na.rm=TRUE)
##D   image.plot( CO.surface,  col=coltab, zlim =zr)
##D     US( add=TRUE,lwd=2)
##D     title( "MAM min temperatures without elevation")
##D   image.plot( CO.full, col=coltab, zlim=zr)
##D     title( "Including elevation")
##D     US( add=TRUE,lwd=2)
## End(Not run)
## Not run: 
##D #### a 3-d example using alternative geometry
##D set.seed( 123)
##D N<- 500
##D x<-  matrix( runif(3* N,-1,1), ncol=3, nrow=N)
##D y<-   10*exp( -rdist( x, rbind( c(.5,.5,.6) ) )/.5)
##D LKinfo<- LKrigSetup( x,  
##D                  LKGeometry = "LKBox",
##D                      nlevel = 1,
##D                      a.wght = 6.01,
##D                          NC = 5,
##D                   NC.buffer = 2,
##D                   normalize = TRUE,
##D              choleskyMemory = list(nnzR= 2e6),
##D                     lambda = .1,
##D                     mean.neighbor=200
##D                    )  
##D # NOTE: memory for the spam routines has been increased to 
##D # avoid warnings  
##D   out1<- LKrig( x,y, LKinfo=LKinfo)
## End(Not run)  
  
## Not run: 
##D # MLE search over lambda and  a bigger problem
##D # but no normalization
##D N<- 5e4
##D x<-  matrix( runif(3* N,-1,1), ncol=3, nrow=N)
##D y<-   10*exp( -rdist( x, rbind( c(.5,.5,.6) ) )/.5)
##D LKinfo<- LKrigSetup( x,  
##D                  LKGeometry = "LKBox",
##D                      nlevel = 1,
##D                      a.wght = 6.01,
##D                          NC = 20,
##D                   NC.buffer = 2,
##D                   normalize = FALSE,
##D              choleskyMemory = list(nnzR= 25e6),
##D                     lambda = .1,
##D                     mean.neighbor=200
##D                    ) 
##D # add in timing                    
##D  system.time(  out1<- LKrig( x,y, LKinfo=LKinfo) ) # about 25 seconds
##D # LKinfo$normalize<- TRUE
##D # system.time(  out2<- LatticeKrig( x,y, LKinfo=LKinfo) )# ~250 seconds
## End(Not run)  
########################################################################
# for a more elaborate search over  a.wght, alpha and lambda to find
# joint MLEs see help(LKrig.MLE)
########################################################################

########################################################################
# A bigger problem: 26K observations and 4.6K basis functions
# fitting takes about 15 seconds on a laptop for a fixed covariance
#  LKrig.MLE to find the MLE (not included) for lambda takes abou
#  8 minutes
#######################################################################
## Not run: 
##D   data(CO2)
##D   # the Ring geometry will be periodic in the first dimension and rectagular on 
##D   # second. A useful approximation for spherical data omitting the polar caps. 
##D   
##D   LKinfo.CO2<- LKrigSetup(CO2$lon.lat, NC=100,nlevel=1, lambda=.2,
##D                        a.wght=5, alpha=1, 
##D                        LKGeometry="LKRing", choleskyMemory = list(nnzR=2e6) )
##D   print(LKinfo.CO2)                                          
##D   obj1<- LKrig( CO2$lon.lat,CO2$y,LKinfo=LKinfo.CO2)
##D # 5700+ basis functions 101X57 lattice  (number of basis functions
##D # reduced in y direction because of a rectangular domain
##D   obj1$trA.est # about 2900+ effective degrees of freedom 
##D #
##D   glist<- list( x= seq( -180,180,,200),y=seq( -80,80,,100) )
##D   fhat<- predictSurface( obj1,grid.list=glist)
##D #Plot data and gap-filled estimate
##D   set.panel(2,1)
##D   quilt.plot(CO2$lon.lat,CO2$y,zlim=c(373,381))
##D   title("Simulated CO2 satellite observations")
##D   world(add=TRUE,col="magenta")
##D   image.plot( fhat,zlim=c(373,381))
##D   world( add=TRUE, col="magenta")
##D   title("Gap-filled global predictions")
## End(Not run)  
 set.panel()
#########################################################################
#  Comparing LKrig to ordinary Kriging
########################################################################

# Here is an illustration of using the fields function mKrig with the
# LKrig covariance to reproduce the computations of LKrig. The
# difference is that mKrig can not take advantage of any sparsity in
# the precision matrix because its inverse, the covariance matrix, is
# not sparse.  This example reinforces the concept that LKrig finds the
# the standard geostatistical estimate but just uses a particular
# covariance function defined via basis functions and the precision
# matrix.
# Load ozone data set (AGAIN)
## Not run: 
##D   data(ozone2)  
##D   x<-ozone2$lon.lat
##D   y<- ozone2$y[16,]
##D # Find location that are not 'NA'.
##D # (LKrig is not set up to handle missing observations.)
##D   good <-  !is.na( y)
##D   x<- x[good,]
##D   y<- y[good]
##D   a.wght<- 5
##D   lambda <-  1.5
##D   obj1<- LKrig( x,y,NC=16,nlevel=1, alpha=1,  lambda=lambda, a.wght=5,
##D                 NtrA=20,iseed=122)
##D  
##D # in both calls iseed is set the same so we can compare 
##D # Monte Carlo estimates of effective degrees of freedom
##D   obj1$trA.est
##D # The covariance "parameters" are all in the list LKinfo
##D # to create this special list outside of a call to LKrig use
##D   LKinfo.test <- LKrigSetup( x, NC=16, nlevel=1, alpha=1.0,  a.wght=5)
##D 
##D # this call to mKrig should be identical to the LKrig results
##D # because it uses the LKrig.cov covariance with all the right parameters.
##D   obj2<- mKrig( x,y, lambda=lambda, m=2, cov.function="LKrig.cov",
##D                       cov.args=list( LKinfo=LKinfo.test), NtrA=20, iseed=122)
##D # compare the two results this is also an
##D # example of how tests are automated in fields
##D # set flag to have tests print results
##D   test.for.zero.flag<- TRUE
##D   test.for.zero( obj1$fitted.values, obj2$fitted.values,
##D                   tag="comparing predicted values LKrig and mKrig")
##D # compare standard errors. 
##D   se1<- predictSE.LKrig( obj1)
##D   se2<- predictSE.mKrig(obj2)
##D   test.for.zero( se1, se2,
##D                   tag="comparing standard errors for LKrig and mKrig")
## End(Not run)

## Not run: 
##D ##################################################################
##D #  a linear inverse problem 
##D ##################################################################
##D # NOTE the settings in the model are small to make for a fast example
##D #
##D data(ozone2)
##D x<- ozone2$lon.lat
##D y<- ozone2$y[16,]
##D good<- !is.na(y)	
##D x<- x[good,]
##D y<- y[good]
##D 
##D LKinfo<- LKrigSetup(x, a.wght=4.5, nlevel=3, nu=1, NC=4, lambda=.01)
##D 
##D # now observe a linear combination
##D   NNDist<- LKDist(x,x, delta=1.5) 
##D   A<- NNDist
##D   A$ra<- exp(-NNDist$ra)
##D # A is a weight matrix based on neighbors close by and
##D # in spind sparse matrix format
##D # now convert to spam format
##D   A<- spind2spam(A)
##D   
##D TMatrix <- get(LKinfo$fixedFunction)(x = x)
##D # Tmatrix is a 3 column matrix of constant and the two spatial coordinates
##D #  i.e. a linear function of the spatial variables 
##D PHI<- LKrig.basis(x, LKinfo)
##D X<-  A%*% PHI
##D U<-  A%*%TMatrix 
##D yIndirect<- A%*%y
##D #
##D # X<-  A##D 
##D 
##D out0<- LatticeKrig(x,y, LKinfo=LKinfo)
##D out1<- LatticeKrig(x,yIndirect, U=U, X=X, LKinfo=LKinfo)
##D 
##D # the predict function evaluates f in this case -- not the fitted values that
##D # are related to the 
##D # observations
##D # partial agreement but not exact -- this is because the observational models
##D # assume different errors
##D #
##D plot( predict(out0,x), predict( out1,x))
##D 
##D out<- LKrig.sim.conditional( out1,M=5, nx=10, ny=10 )
## End(Not run)	




