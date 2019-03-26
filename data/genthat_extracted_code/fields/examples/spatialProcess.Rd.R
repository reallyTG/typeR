library(fields)


### Name: spatialProcess
### Title: Estimates a spatial process model.
### Aliases: spatialProcess plot.spatialProcess print.spatialProcess
### Keywords: spatial

### ** Examples

data( ozone2)
# x is a two column matrix where each row is a location in lon/lat 
# coordinates
  x<- ozone2$lon.lat
# y is a vector of ozone measurements at day 16 a the locations. 
  y<- ozone2$y[16,]
  obj<- spatialProcess( x, y)
# summary of model
  summary( obj)
# diagnostic plots
  set.panel(2,2)
  plot(obj)
# plot 1 data vs. predicted values
# plot 2 residuals vs. predicted
# plot 3 criteria to select the smoothing
#        parameter lambda = sigma^2 / rho
#        the x axis has transformed lambda
#        in terms of effective degrees of freedom 
#        to make it easier to interpret
#        Note that here the GCV function is minimized
#        while the REML is maximzed. 
# plot 4 the log profile likelihood used to 
#        determine theta. 
#
# predictions on a grid 
  surface( obj)
#(see also predictSurface for more control on evaluation grid
# and plotting)
#  

## Not run: 
##D # working with covariates and filling in missing station data
##D # using an ensemble method
##D # see the example under  help(sim.spatialProcess) to see how to 
##D # handle a conditional simulation on a grid of predictions with 
##D # covariates. 
##D data(COmonthlyMet)
##D   fit1E<- spatialProcess(CO.loc,CO.tmin.MAM.climate, Z=CO.elev, 
##D                                theta.range= c(.25, 2.0) )
##D   set.panel( 2,2)                             
##D   plot( fit1E)
##D   
##D # conditional simulation at missing data
##D   notThere<- is.na(CO.tmin.MAM.climate )
##D   xp <- CO.loc[notThere,]
##D   Zp <- CO.elev[notThere]
##D   infill<- sim.spatialProcess( fit1E, xp=xp,
##D                       Z= Zp, M= 10)
##D #  
##D # interpretation is that these infilled values are all equally plausible 
##D # given the observations and also given the estimated covariance model
##D #  
##D # for extra credit one could now standardized the infilled values to have
##D # conditional mean and variance from the exact computations
##D #  e.g. predict( fit1E, xp=CO.loc[!good,],  Z= CO.elev[!good])
##D #  and  predictSE(fit1E, xp=CO.loc[!good,],  Z= CO.elev[!good])  
##D # with these standardization one would still preserve the correlations
##D # among the infilled values that is also important for considering them as a
##D # multivariate prediction.
##D # conditional simulation on a grid but not using the covariate of elevation
##D  fit2<- spatialProcess(CO.loc,CO.tmin.MAM.climate, 
##D                                theta.range= c(.25, 2.0) )
##D # note larger range parameter
##D # create 2500 grids using handy function
##D gridList <- fields.x.to.grid( fit2$x, nx=50,ny=50)
##D xGrid<- make.surface.grid( gridList)
##D ensemble<- sim.spatialProcess( fit2, xp=xGrid, M= 5)
##D # this is an "n^3" computation so increasing the grid size 
##D # can slow things down for computation 
##D image.plot( as.surface( xGrid, ensemble[1,]))
##D set.panel()
## End(Not run)

## Not run: 
##D data( ozone2)
##D # x is a two column matrix where each row is a location in lon/lat 
##D # coordinates
##D   x<- ozone2$lon.lat
##D # y is a vector of ozone measurements at day 16 a the locations. 
##D   y<- ozone2$y[16,]
##D # a comparison to using an exponential and Wendland covariance function
##D # and great circle distance -- just to make range easier to interpret.
##D     obj <- spatialProcess( x, y,
##D                               Distance = "rdist.earth")
##D 	obj2<- spatialProcess( x, y,
##D 	        cov.args = list(Covariance = "Exponential"), 
##D                               Distance = "rdist.earth" )
##D 	obj3<- spatialProcess( x, y,
##D 	        cov.args = list(Covariance = "Wendland",
##D 	                        dimension  = 2,
##D 	                                 k = 2),
##D 	                          Distance = "rdist.earth")
##D # obj2 could be also be fit using the argument:
##D #   cov.args = list(Covariance = "Matern", smoothness=.5)
##D #	                          
##D # Note very different range parameters - BTW these are in miles
##D # but similar nugget variances. 
##D obj$pars
##D obj2$pars
##D obj3$pars
##D # since the exponential is Matern with smoothness == .5 the first two
##D # fits can be compared in terms of their likelihoods
##D # the REML value is slightly higher for obj verses obj2 (598.4  > 596.7)
##D # these are the _negative_ log  likelihoods so suggests a preference for the
##D # exponential model 
##D # 
##D # does it really matter in terms of spatial prediction?
##D set.panel( 3,1)
##D surface( obj)
##D US( add=TRUE)
##D title("Matern sm= 1.0")
##D surface( obj2)
##D US( add=TRUE)
##D title("Matern sm= .5")
##D surface( obj3)
##D US( add=TRUE)
##D title("Wendland k =2")
##D # prediction standard errors
##D # these take a while because prediction errors are based 
##D # directly on the Kriging weight matrix
##D # see mKrig for an alternative.
##D set.panel( 2,1)
##D out.p<- predictSurfaceSE( obj, nx=40,ny=40)
##D surface( out.p)
##D US( add=TRUE)
##D title("Matern sm= 1.0")
##D points( x, col="magenta")
##D #
##D out.p<- predictSurfaceSE( obj, nx=40,ny=40)
##D surface( out.p)
##D US( add=TRUE)
##D points( x, col="magenta")
##D title("Matern sm= .5")
## End(Not run)
set.panel(1,1)

## Not run: 
##D ### comparison with GeoR
##D   data(ozone2)
##D   x<- ozone2$lon.lat
##D   y<- ozone2$y[16,]
##D   good<-!is.na(y)
##D   x1<- x[good,]
##D   y1<- y[good]
##D   
##D   obj<- spatialProcess( x, y, mKrig.args= list(m=1), smoothness = .5 )
##D   
##D   library( geoR)
##D   ml.n <- likfit(coords= x1, data=y1, ini = c(570, 3), nug = 50)
##D   # compare to 
##D   stuffFields<- obj$MLEInfo$MLEJoint$summary[c(1,3,4,5)]
##D   stuffGeoR<- c( ml.n$loglik, ml.n$phi, sqrt(ml.n$nugget),ml.n$sigmasq) 
##D   test.for.zero(  max(stuffFields/stuffGeoR), 1, tol=.004)    
## End(Not run)



