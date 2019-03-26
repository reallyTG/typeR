library(LatticeKrig)


### Name: LatticeKrig
### Title: User-friendly spatial prediction and inference using a compactly
###   supported multi-resolution basis and a lattice model for the basis
###   coefficients.
### Aliases: LatticeKrig print.LatticeKrig
### Keywords: spatial

### ** Examples

# Load ozone data set
  data(ozone2)  
  x<-ozone2$lon.lat
  y<- ozone2$y[16,]

# thin plate spline-like model with the lambda parameter estimated by
# maximum likelihood. Default choices are made for a.wght, nlevel, NC
# and alpha.

  obj<- LatticeKrig( x, y)
## Not run: 
##D # summary of fit and a plot of fitted surface
##D   print( obj)
##D   surface( obj )
##D   US(add=TRUE)
##D   points(x)
##D # prediction standard errors
##D   out.se<- predictSE( obj, xnew= x)
##D # predict at observations:
##D   out.fhat<- predict( obj, xnew= x)
##D # coveniently predict on a 100X100 grid for plotting
##D  out.surf<- predictSurface( obj, nx=100, ny=100)
##D # image.plot( out.surf) 
## End(Not run)
# running an example by first setting up the model object
## Not run: 
##D # this is just a small model to run quickly
##D # compare the LKinfo object here  to one created implictily:  obj$LKinfo
##D LKinfo1<- LKrigSetup( x, NC=5, nlevel=3, a.wght=4.1, nu=1.0)
##D obj1<- LatticeKrig( x,y, LKinfo= LKinfo1)
## End(Not run)
#
# In this example lon/lat are treated as just Euclidean coordinates 
# a quick adjustment for small regions is to account for the difference
# in physical distance in N-S verses E_W
# is to just scale the longitude degrees to be comparable to degrees in latitude
# at least in the middle of the domain. The assumption is that for small spatial
# domains this approximation will not be bad for the coordinates at the edges too.
# You accomplish this by adding a scaling, V matrix:
# Here the V argument is rolled into the LKinfo object created within the function
#
## Not run: 
##D   meanLat<- mean( x[,2])*pi/180
##D   Vlonlat <- diag(  c( 1/cos(meanLat), 1) )
##D   obj1<- LatticeKrig( x, y, V = Vlonlat )
## End(Not run)

## Not run: 
##D # Refit using with just one level of  basis functions
##D # on a 20X20 grid witin the spatial domain ( so about 400) 
##D # actually number is 720 ( see obj1b$LKinfo) due adding edge nodes
##D # Add an aspect ratio of spatial domain 
##D # and find the a.wght parameter along with nugget and process variances.
##D # this takes a while partly because LatticeKrig model is not optimized for small data sets!
##D   obj1b<- LatticeKrig( x, y, nlevel=1, NC=20, findAwght=TRUE)
##D # rudimentary look at how likelihood was optimized
##D #log lambda and omega =  log(a.wght-4)/2 are useful parametrizations ...
##D   quilt.plot( obj1b$MLE$lnLike.eval[,c("logLambda","omega")],
##D        obj1b$MLE$lnLike.eval[,"lnProfileLike.FULL"], 
##D        xlab="loglamda", ylab="omega",
##D        zlim =c(-640,-612))
##D   points( obj1b$MLE$lnLike.eval[,c("logLambda","omega")],cex=.25)
##D       
## End(Not run)
# fitting replicate spatial data sets
# here we use the common observations over days for the ozone
# data set. Whether these are true replicated fields is in question
# but the analysis is still useful

## Not run: 
##D Y<-  na.omit( t( ozone2$y) ) 
##D ind<- attr( Y,"na.action")
##D X<- ozone2$lon.lat[-ind, ]
##D 
##D out1<- LatticeKrig( X, Y, nlevel=1, NC=20, findAwght=TRUE)
##D out2<- LatticeKrig( X, Y, nlevel=1, NC=20, findAwght=TRUE,
##D                         collapseFixedEffect=TRUE)
##D # compare the two models 
##D # Note second a.wght reflects more spatial correlation when individual 
##D # fixed effect is not removed ( 4.4 verses 4.07)
##D # nugget variance is nearly the same!
##D out1$MLE$summary[1:7]                        
##D out2$MLE$summary[1:7]
##D                         
##D 
##D 
## End(Not run)
## Not run: 
##D # Refit using the tensor product type of basis functions
##D # (default is "Radial"). An example how an additional argument that is 
##D # passed to the LKrigsetup function to create the LKinfo object.
##D   obj2<- LatticeKrig( x, y, BasisType="Tensor")
## End(Not run)

#
# A 1-d example with 3 levels of basis functions
# See LKrig for an explanation if nlevel, NC,  alpha and a.wght 
# covariance parameters.


## Not run: 
##D  x<- matrix(rat.diet$t)
##D  y<- rat.diet$trt
##D  fitObj<- LatticeKrig( x, y)
##D # NOTE lots of defaults are set for the model! See print( fitObj)
##D  plot( x,y)
##D  xg<- matrix(seq( 0,105,,100))
##D  lines( xg, predict(fitObj, xg) )
## End(Not run)

## Not run: 
##D #  a 3D example
##D set.seed( 123)
##D N<- 1000
##D x<-  matrix( runif(3* N,-1,1), ncol=3, nrow=N)
##D y<-   10*exp( -rdist( x, rbind( c(.5,.5,.6) ) )/.5)
##D 
##D # NOTE setting of memory size for Cholesky. This avoids some warnings and
##D # extra computation by the spam package
##D LKinfo<- LKrigSetup( x,  nlevel=1,  a.wght= 6.01, NC=6, NC.buffer=2,
##D                     LKGeometry="LKBox", normalize=FALSE, mean.neighbor=200,
##D                     choleskyMemory=list(nnzR= 2E6) )                                      
##D out1<- LatticeKrig( x,y, LKinfo=LKinfo)
##D 
##D glist<- list( x1=seq( -1,1,,30), x2=seq( -1,1,,30), x3 = 0)
##D xgrid<- make.surface.grid( glist)
##D 
##D yhat<- predict( out1, xgrid)
##D # compare yhat to true function created above
##D image.plot( as.surface( glist, yhat))
##D 
## End(Not run)
#
###########################################################################
# Including a covariate (linear fixed part in spatial model)
########################################################################## 
## Not run: 
##D   data(COmonthlyMet)
##D 
##D   obj  <- LatticeKrig(CO.loc,  CO.tmin.MAM.climate, Z=CO.elev)
##D   obj2 <- LatticeKrig(CO.loc, CO.tmin.MAM.climate)
##D 
##D # compare with and without linear covariates
##D   set.panel(1,2)
##D   surface(obj)
##D   US(add=TRUE)
##D   title("With Elevation Covariate")
##D 
##D   surface(obj2)
##D   US(add=TRUE)
##D   title("Without Elevation Covariate")
##D 
## End(Not run)
## Not run: 
##D  data(COmonthlyMet)
##D # Examining a few different "range" parameters
##D a.wghtGrid<-  4  +  c(.05, .1, .5, 1, 2, 4)^2
##D 
##D #NOTE smallest is "spline like" the largest is essentially independent
##D # coefficients at each level.  In this case the "independent" end is
##D # favored but the eff df. of the surface is very similar across models
##D # indicating about the same separate of the estimates into spatial
##D # signal and noise
##D #
##D for( k in 1:5 ){
##D obj  <- LatticeKrig(CO.loc,  CO.tmin.MAM.climate, Z=CO.elev, 
##D                       a.wght=a.wghtGrid[k])
##D cat( "a.wght:", a.wghtGrid[k], "ln Profile Like:",
##D             obj$lnProfileLike, "Eff df:", obj$trA.est, fill=TRUE)
##D }
##D 
##D # MLE
##D obj0  <- LatticeKrig(CO.loc,  CO.tmin.MAM.climate, Z=CO.elev, 
##D                      findAwght=TRUE)
##D print(obj0$MLE$summary)
## End(Not run)

#########################################################################
# Reproducing some of the analysis for the example in the
# JCGS LatticeKrig paper.
#########################################################################

#### Here is an example of dealing with approximate spherical geometry.
## Not run: 
##D data(NorthAmericanRainfall)
##D library(mapproj)
##D x<- cbind(NorthAmericanRainfall$longitude, NorthAmericanRainfall$latitude)
##D y<- NorthAmericanRainfall$precip
##D log.y<- log(y)
##D elev<- NorthAmericanRainfall$elevation
##D # this is a simple projection as part of this and handled by the mapproj package
##D x.s<- mapproject( x[,1], x[,2], projection="stereographic")
##D x.s<- cbind( x.s$x, x.s$y)
##D 
##D # an alternative is to transform coordinates using another projection,
##D # e.g. a Lambert conformal projection
##D # with the project function from the rgdal package
##D # library( rgdal)
##D # x.s<- project(x,"+proj=lcc +lat_1=22 +lat_2=58 +lon_0=-93 +ellps=WGS84")
##D # this package has the advantage that the inverse projection is also 
##D # included ( inv=TRUE) so it is easy to evaluate the surface back on a Mercator grid.
##D              
##D obj0<- LatticeKrig(x.s, log.y, Z=elev )
##D 
##D fitSurface<- predictSurface( obj0, drop.Z=TRUE)
##D fitSurface$z<-  exp(fitSurface$z)/100
##D colorTable<- designer.colors( 256, c("red4", "orange", "yellow","green1", "green4", "blue"))
##D image.plot( fitSurface, col=colorTable)
##D map( "world", add=TRUE, col="grey30", lwd=3, proj="") 
##D 
## End(Not run)




