library(fields)


### Name: MLESpatialProcess
### Title: Estimates key covariance parameters for a spatial process.
### Aliases: MLESpatialProcess
### Keywords: spatial

### ** Examples

#
#
#generate observation locations (100 is small just to make this run quickly)
n=100
set.seed(124)
x = matrix(runif(2*n), nrow=n)
#generate observations at the locations
trueTheta = .1
trueSigma = .01
Sigma = exp( -rdist(x,x) /trueTheta ) 
# y = t(chol(Sigma))%*% (rnorm(n))  +  trueSigma * rnorm( n)
y = t(chol(Sigma))%*% (rnorm(n))  +  trueSigma * rnorm( n)
# Use exponential covariance estimate constant function for mean
out = MLESpatialProcess(x, y, 
                          smoothness=.5,
                        mKrig.args = list( m = 1)
                        )
# Use exponential covariance, use a range to determine MLE of range parameter
## Not run: 
##D #Use Matern covariance, compute joint MLE of range, smoothness, and lambda.  
##D #This may take a few seconds
##D testSmoothness = c(.5, 1, 2)
##D for( nu in testSmoothness){
##D   out = MLESpatialProcess(x, y, cov.args=list(Covariance="Matern"), smoothness=nu) 
##D   print( out$MLEJoint$summary)
##D }
##D 
## End(Not run)

# example with a covariate  
## Not run: 
##D data(COmonthlyMet)
##D ind<- !is.na( CO.tmean.MAM.climate)
##D x<- CO.loc[ind,]
##D y<- CO.tmean.MAM.climate[ind]
##D elev<- CO.elev[ind]
##D obj2<-  MLESpatialProcess( x,y)
##D obj3<-  MLESpatialProcess( x,y, Z=elev)
##D 
##D # elevation makes a difference
##D obj2$MLEJoint$summary
##D obj3$MLEJoint$summary
##D 
##D   
## End(Not run)
 ## Not run: 
##D # fits for first 10 days from ozone data
##D data( ozone2) 	 
##D NDays<- 10
##D O3MLE<- matrix( NA, nrow= NDays, ncol=7)
##D for( day in 1: NDays){
##D 	cat( day, " ")
##D 	ind<- !is.na(ozone2$y[day,] )
##D 	x<- ozone2$lon.lat[ind,]
##D 	y<- ozone2$y[day,ind]
##D 	print( length( y))
##D 	O3MLE[day,]<- MLESpatialProcess( x,y,
##D 	            Distance="rdist.earth")$MLEJoint$summary
##D }
##D # NOTE: names of summary:
##D #[1] "lnProfileLike.FULL" "lambda"            
##D #[3] "theta"              "sigmaMLE"          
##D #[5] "rhoMLE"             "funEval"           
##D #[7] "gradEval" 
##D plot( log(O3MLE[,2]), log(O3MLE[,3]))
## End(Not run)  



