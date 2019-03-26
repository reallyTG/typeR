library(fields)


### Name: Krig
### Title: Kriging surface estimate
### Aliases: Krig resid.Krig fitted.Krig coef.Krig
### Keywords: spatial

### ** Examples


# a 2-d example 
# fitting a surface to ozone  
# measurements. Exponential covariance, range parameter is 20 (in miles) 

fit <- Krig(ChicagoO3$x, ChicagoO3$y, theta=20)  
 
summary( fit) # summary of fit 
set.panel( 2,2) 
plot(fit) # four diagnostic plots of fit  
set.panel()
surface( fit, type="C") # look at the surface 

# predict at data
predict( fit)

# predict using 7.5 effective degrees of freedom:
predict( fit, df=7.5)


# predict on a grid ( grid chosen here by defaults)
 out<- predictSurface( fit)
 surface( out, type="C") # option "C" our favorite

# predict at arbitrary points (10,-10) and (20, 15)
 xnew<- rbind( c( 10, -10), c( 20, 15))
 predict( fit, xnew)

# standard errors of prediction based on covariance model.  
 predictSE( fit, xnew)

# surface of standard errors on a default grid
 predictSurfaceSE( fit)-> out.p # this takes some time!
 surface( out.p, type="C")
 points( fit$x)

## Not run: 
##D # Using another stationary covariance. 
##D # smoothness is the shape parameter for the Matern. 
##D 
##D fit <- Krig(ChicagoO3$x, ChicagoO3$y, Covariance="Matern", theta=10, smoothness=1.0)  
##D summary( fit)
##D 
##D #
##D # Roll your own: creating very simple user defined Gaussian covariance 
##D #
##D 
##D test.cov <- function(x1,x2,theta,marginal=FALSE,C=NA){
##D    # return marginal variance
##D      if( marginal) { return(rep( 1, nrow( x1)))}
##D 
##D     # find cross covariance matrix     
##D       temp<- exp(-(rdist(x1,x2)/theta)**2)
##D       if( is.na(C[1])){
##D           return( temp)}
##D       else{
##D           return( temp%*%C)}
##D       } 
##D #
##D # use this and put in quadratic polynomial fixed function 
##D 
##D 
##D  fit.flame<- Krig(flame$x, flame$y, cov.function="test.cov", m=3, theta=.5)
##D 
##D #
##D # note how range parameter is passed to Krig.   
##D # BTW:  GCV indicates an interpolating model (nugget variance is zero) 
##D # This is the content of the warning message.
##D 
##D # take a look ...
##D  surface(fit.flame, type="I") 
## End(Not run)

# 
# Thin plate spline fit to ozone data using the radial 
# basis function as a generalized covariance function 
#
# p=2 is the power in the radial basis function (with a log term added for 
# even dimensions)
# If m is the degree of derivative in penalty then p=2m-d 
# where d is the dimension of x. p must be greater than 0. 
#  In the example below p = 2*2 - 2 = 2  
#

 out<- Krig( ChicagoO3$x, ChicagoO3$y,cov.function="Rad.cov", 
                       m=2,p=2,scale.type="range") 

# See also the Fields function Tps
# out  should be identical to  Tps( ChicagoO3$x, ChicagoO3$y)
# 

# A Knot example

 data(ozone2)
 y16<- ozone2$y[16,] 

# there are some missing values -- remove them 
 good<- !is.na( y16)
 y<- y16[good] 
 x<- ozone2$lon.lat[ good,]

#
# the knots can be arbitrary but just for fun find them with a space 
# filling design. Here we select  50 from the full set of 147 points
#
 xknots<- cover.design( x, 50, num.nn= 75)$design  # select 50 knot points

 out<- Krig( x, y, knots=xknots,  cov.function="Exp.cov", theta=300)  
 summary( out)
# note that that trA found by GCV is around 17 so 50>17  knots may be a 
# reasonable approximation to the full estimator. 
#
## Not run: 
##D # the plot 
##D  surface( out, type="C")
##D  US( add=TRUE)
##D  points( x, col=2)
##D  points( xknots, cex=2, pch="O")
## End(Not run)
## Not run: 
##D ## A quick way to deal with too much data if you intend to smooth it anyway
##D ##  Discretize the locations to a grid, then apply Krig 
##D ##  to the discretized locations:
##D ## 
##D RM.approx<- as.image(RMprecip$y, x=RMprecip$x, nx=20, ny=20)
##D 
##D # take a look:
##D image.plot( RM.approx)
##D # discretized data (observations averaged if in the same grid box)
##D # 336 locations -- down form the  full 806
##D 
##D # convert the image format to locations, obs and weight vectors
##D yd<- RM.approx$z[RM.approx$ind]
##D weights<- RM.approx$weights[RM.approx$ind] # takes into account averaging
##D xd<- RM.approx$xd
##D 
##D obj<- Krig( xd, yd, weights=weights, theta=4)
##D 
##D # compare to the full fit:
##D # Krig( RMprecip$x, RMprecip$y, theta=4) 
## End(Not run)

## Not run: 
##D # A correlation model example
##D # fit krig surface using a mean and sd function to standardize 
##D # first get stats from 1987 summer Midwest O3 data set 
##D  data(ozone2)
##D  stats.o3<- stats( ozone2$y)
##D  mean.o3<- Tps( ozone2$lon.lat, c( stats.o3[2,]))
##D  sd.o3<- Tps(  ozone2$lon.lat, c( stats.o3[3,]))
##D 
##D #
##D # Now use these to fit particular day ( day 16) 
##D # and use great circle distance 
##D 
##D 
##D  fit<- Krig( ozone2$lon.lat, ozone2$y[16,], 
##D             theta=350, mean.obj=mean.o3, sd.obj=sd.o3, 
##D             Covariance="Matern", Distance="rdist.earth",
##D             smoothness=1.0,
##D             na.rm=TRUE) #
##D 
##D 
##D # the finale
##D  surface( fit, type="I")
##D  US( add=TRUE)
##D  points( fit$x)
##D  title("Estimated ozone surface")
## End(Not run)
## Not run: 
##D #
##D #
##D # explore some different values for the range and lambda using REML
##D   theta <- seq( 100,500,,40)
##D   PLL<- matrix( NA, 40,80)
##D # the loop 
##D   for( k in 1:40){
##D # call to Krig with different ranges
##D # also turn off warnings for GCV search 
##D # to avoid lots of messages. (not recommended in general!)
##D     PLL[k,]<- Krig( ozone2$lon.lat,ozone2$y[16,],
##D              cov.function="stationary.cov", 
##D              theta=theta[k], mean.obj=mean.o3, sd.obj=sd.o3, 
##D              Covariance="Matern",smoothness=.5, 
##D              Distance="rdist.earth", nstep.cv=80,
##D              give.warnings=FALSE, na.rm=TRUE)$gcv.grid[,7]
##D #
##D # gcv.grid is the grid search output from 
##D # the optimization for estimating different estimates for lambda including 
##D # REML
##D # default grid is equally spaced in eff.df scale ( and should the same across theta)
##D #  here 
##D   }
##D # get lambda grid  from looping 
##D    k<- 1
##D    lam<-  Krig( ozone2$lon.lat,ozone2$y[16,],
##D              cov.function="stationary.cov", 
##D              theta=theta[k], mean.obj=mean.o3, sd.obj=sd.o3, 
##D              Covariance="Matern",smoothness=.5, 
##D              Distance="rdist.earth", nstep.cv=80,
##D              give.warnings=FALSE, na.rm=TRUE)$gcv.grid[,1]
##D # see the 2 column of $gcv.grid to get the effective degress of freedom. 
##D   contour( theta,log(lam) , PLL)
##D  
## End(Not run)



