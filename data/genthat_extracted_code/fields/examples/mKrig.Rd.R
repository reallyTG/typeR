library(fields)


### Name: mKrig
### Title: "micro Krig" Spatial process estimate of a curve or surface,
###   "kriging" with a known covariance function.
### Aliases: mKrig predict.mKrig mKrig.coef mKrig.trace print.mKrig
###   summary.mKrig mKrigCheckXY
### Keywords: spatial

### ** Examples

#
# Midwest ozone data  'day 16' stripped of missings 
  data( ozone2)
  y<- ozone2$y[16,]
  good<- !is.na( y)
  y<-y[good]
  x<- ozone2$lon.lat[good,]
# nearly interpolate using defaults (Exponential covariance range = 2.0)
# see also mKrigMLEGrid to choose lambda by maxmimum likelihood
  out<- mKrig( x,y, theta = 2.0, lambda=.01)
  out.p<- predictSurface( out)
  surface( out.p)
#
# NOTE this should be identical to 
# Krig( x,y, theta=2.0, lambda=.01) 

##############################################################################
# an example using a "Z" covariate and the Matern family
#  again see mKrigMLEGrid to choose parameters by MLE.
data(COmonthlyMet)
yCO<- CO.tmin.MAM.climate
good<- !is.na( yCO)
yCO<-yCO[good]
xCO<- CO.loc[good,]
Z<- CO.elev[good]
out<- mKrig( xCO,yCO, Z=Z, cov.function="stationary.cov", Covariance="Matern",
                    theta=4.0, smoothness=1.0, lambda=.1)
set.panel(2,1)
# quilt.plot with elevations
quilt.plot( xCO, predict(out))
# Smooth surface without elevation linear term included
surface( out)
set.panel()

#########################################################################
# Interpolate using tapered version of the exponential, 
# the taper scale is set to 1.5 default taper covariance is the Wendland.
# Tapering will done at a scale of 1.5 relative to the scaling 
# done through the theta  passed to the covariance function.
data( ozone2)
  y<- ozone2$y[16,]
  good<- !is.na( y)
  y<-y[good]
  x<- ozone2$lon.lat[good,]
  mKrig( x,y,cov.function="stationary.taper.cov",
       theta = 2.0, lambda=.01, 
       Taper="Wendland",  Taper.args=list(theta = 1.5, k=2, dimension=2)
           ) -> out2

# Try out GCV on a grid of lambda's.
# For this small data set 
# one should really just use Krig or Tps but this is an example of
# approximate GCV that will work for much larger data sets using sparse 
# covariances and the Monte Carlo trace estimate
#
# a grid of lambdas:
  lgrid<- 10**seq(-1,1,,15) 
  GCV<- matrix( NA, 15,20)
  trA<-  matrix( NA, 15,20)
  GCV.est<- rep( NA, 15)
  eff.df<- rep( NA, 15)
  logPL<- rep( NA, 15) 
# loop over lambda's
  for(  k in 1:15){
      out<- mKrig( x,y,cov.function="stationary.taper.cov",
                    theta = 2.0, lambda=lgrid[k],
          Taper="Wendland",  Taper.args=list(theta = 1.5, k=2, dimension=2)  ) 
      GCV[k,]<- out$GCV.info
      trA[k,]<- out$trA.info
      eff.df[k]<- out$eff.df
      GCV.est[k]<- out$GCV
      logPL[k]<- out$lnProfileLike
  }
#
# plot the results different curves are for individual estimates  
# the two lines are whether one averages first the traces or the GCV criterion.
#
  par( mar=c(5,4,4,6))
  matplot( trA, GCV, type="l", col=1, lty=2,
            xlab="effective degrees of freedom", ylab="GCV")
  lines( eff.df, GCV.est, lwd=2, col=2)
  lines( eff.df, rowMeans(GCV), lwd=2)
# add exact GCV computed by Krig 
  out0<-  Krig( x,y,cov.function="stationary.taper.cov",
              theta = 2.0, 
              Taper="Wendland", Taper.args=list(theta = 1.5, k=2, dimension=2),
              spam.format=FALSE)  
  lines( out0$gcv.grid[,2:3], lwd=4, col="darkgreen")

# add profile likelihood 
  utemp<- par()$usr
  utemp[3:4] <- range( -logPL)
  par( usr=utemp)
  lines( eff.df, -logPL, lwd=2, col="blue", lty=2)
  axis( 4)
  mtext( side=4,line=3, "-ln profile likelihood", col="blue")
  title( "GCV ( green = exact) and  -ln profile likelihood", cex=2)

#########################################################################
# here is a series of examples with bigger datasets  
# using a compactly supported covariance directly

set.seed( 334)
N<- 1000
x<- matrix( 2*(runif(2*N)-.5),ncol=2)
y<- sin( 1.8*pi*x[,1])*sin( 2.5*pi*x[,2]) + rnorm( 1000)*.1
  
look2<-mKrig( x,y, cov.function="wendland.cov",k=2, theta=.2, 
            lambda=.1)

# take a look at fitted surface
predictSurface(look2)-> out.p
surface( out.p)

# this works because the number of nonzero elements within distance theta
# are less than the default maximum allocated size of the 
# sparse covariance matrix. 
#  see  options() for the default values. The names follow the convention
# spam.arg where arg is the name of the spam component 
#   e.g. spam.nearestdistnnz

# The following will give a warning for theta=.9 because 
# allocation for the  covariance matirx storage is too small. 
# Here theta controls the support of the covariance and so 
# indirectly the  number of nonzero elements in the sparse matrix

## Not run: 
##D  look2<- mKrig( x,y, cov.function="wendland.cov",k=2, theta=.9, lambda=.1)
## End(Not run)

# The warning resets the memory allocation  for the covariance matrix
# according the to values   options(spam.nearestdistnnz=c(416052,400))'
# this is inefficient becuase the preliminary pass failed. 

# the following call completes the computation in "one pass"
# without a warning and without having to reallocate more memory. 

options( spam.nearestdistnnz=c(416052,400))
  look2<- mKrig( x,y, cov.function="wendland.cov",k=2,
                    theta=.9, lambda=1e-2)
# as a check notice that 
#   print( look2)
# reports the number of nonzero elements consistent with the specifc allocation
# increase in spam.options


# new data set of 1500 locations
  set.seed( 234)
  N<- 1500
  x<- matrix( 2*(runif(2*N)-.5),ncol=2)
  y<- sin( 1.8*pi*x[,1])*sin( 2.5*pi*x[,2]) + rnorm( N)*.01

## Not run: 
##D   
##D # the following is an example of where the allocation  (for nnzR) 
##D # for the cholesky factor is too small. A warning is issued and 
##D # the allocation is increased by 25##D 
##D #
##D  look2<- mKrig( x,y, 
##D             cov.function="wendland.cov",k=2, theta=.1, lambda=1e2  )
## End(Not run)
# to avoid the warning 
 look2<-mKrig( x,y, 
            cov.function="wendland.cov", k=2, theta=.1, 
            lambda=1e2, chol.args=list(pivot=TRUE, memory=list(nnzR= 450000)))

###############################################################################
# fiting multiple data sets
#
#\dontrun{ 
  y1<- sin( 1.8*pi*x[,1])*sin( 2.5*pi*x[,2]) + rnorm( N)*.01
  y2<- sin( 1.8*pi*x[,1])*sin( 2.5*pi*x[,2]) + rnorm( N)*.01
  Y<- cbind(y1,y2)
  look3<- mKrig( x,Y,cov.function="wendland.cov",k=2, theta=.1, 
            lambda=1e2  )
# note slight difference in summary because two data sets have been fit.
  print( look3)
#}

##################################################################
# finding a good choice for theta as a taper 

# Suppose the target is a spatial prediction using roughly 50 nearest neighbors
# (tapering covariances is effective for roughly 20 or more in the situation of 
#  interpolation) see Furrer, Genton and Nychka (2006).
# take a look at a random set of 100 points to get idea of scale
# and saving  computation time by not  looking at the complete set
# of points
# NOTE: This could also be done directly using the  FNN package for finding nearest 
# neighbors
  set.seed(223)
  ind<- sample( 1:N,100)
  hold<- rdist( x[ind,], x)
  dd<- apply( hold, 1, quantile, p= 50/N )
  dguess<- max(dd)
# dguess is now a reasonable guess at finding cutoff distance for
# 50 or so neighbors
# full distance matrix excluding distances greater than dguess
  hold2<- nearest.dist( x, x, delta= dguess )
# here is trick to find the number of nonsero rows for a matrix in spam format. 
  hold3<-  diff( hold2@rowpointers)
#  min( hold3) = 43   which we declare close enough. This also counts the diagonal
# So there are a minimum of 42 nearest neighbors  ( median is 136)
# see  table( hold3) for the distribution 
# now the following will use no less than 43 - 1  nearest neighbors 
# due to the tapering. 
## Not run: 
##D   mKrig( x,y, cov.function="wendland.cov",k=2, theta=dguess, 
##D             lambda=1e2) ->  look2
## End(Not run)

###############################################################################
# use precomputed distance matrix
#
## Not run: 
##D  
##D   y1<- sin( 1.8*pi*x[,1])*sin( 2.5*pi*x[,2]) + rnorm( N)*.01
##D   y2<- sin( 1.8*pi*x[,1])*sin( 2.5*pi*x[,2]) + rnorm( N)*.01
##D   Y<- cbind(y1,y2)
##D   #precompute distance matrix in compact form
##D   distMat = rdist(x, compact=TRUE)
##D   look3<- mKrig( x,Y,cov.function="stationary.cov", theta=.1, 
##D             lambda=1e2, distMat=distMat )
##D   #precompute distance matrix in standard form
##D   distMat = rdist(x)
##D   look3<- mKrig( x,Y,cov.function="stationary.cov", theta=.1, 
##D             lambda=1e2, distMat=distMat )
## End(Not run)



