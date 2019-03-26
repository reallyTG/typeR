library(fields)


### Name: REML.test
### Title: Maximum Likelihood estimates for some Matern covariance
###   parameters.
### Aliases: REML.test MLE.Matern MLE.Matern.fast MLE.objective.fn
###   MaternGLS.test MaternGLSProfile.test MaternQR.test
###   MaternQRProfile.test
### Keywords: spatial

### ** Examples

# Just look at one day from the ozone2 
data(ozone2)

out<- MLE.Matern( ozone2$lon.lat,ozone2$y[16,],1.5, ngrid=8)
plot( out$REML.grid)
points( out$pars[2], out$REML, cex=2)
xline( out$pars[2], col="blue", lwd=2)
## Not run: 
##D # to get a finer grid on initial search:
##D out<- MLE.Matern( ozone2$lon.lat,ozone2$y[16,],1.5,
##D                       theta.grid=c(.3,2), ngrid=40) 
##D 
##D # simulated data  200 points uniformly distributed
##D set.seed( 123)
##D x<- matrix( runif( 2*200), ncol=2)
##D n<- nrow(x)
##D rho= 2.0
##D sigma= .05
##D theta=.5
##D 
##D Cov.mat<-  rho* Matern( rdist(x,x), smoothness=1.0, range=theta)
##D A<- chol( Cov.mat)
##D gtrue<- t(A) %*% rnorm(n)
##D gtrue<- c( gtrue)
##D err<-  rnorm(n)*sigma
##D y<- gtrue + err
##D out0<- MLE.Matern( x,y,smoothness=1.0) # the bullet proof version
##D # the MLEs and -log likelihood at maximum
##D print( out0$pars)
##D print( out0$REML)
##D 
##D out<- MLE.Matern.fast( x,y, smoothness=1.0) # for the impatient
##D # the MLEs:
##D print( out$pars) 
##D print( out$REML)
##D 
##D 
##D # MLE for fixed theta (actually the MLE from out0) 
##D # that uses MLE.objective.fn directly
##D info<- list( x=x,y=y,smoothness=1.0, ngrid=80)
##D # the MLEs:
##D out2<- MLE.objective.fn(log(out0$pars[2]), info, value=FALSE)
##D print( out2$pars)
## End(Not run)

## Not run: 
##D # Now back to Midwest ozone pollution ...
##D # Find the MLEs for ozone data and evaluate the Kriging surface.
##D   data(ozone2)
##D   out<- MLE.Matern.fast( ozone2$lon.lat,ozone2$y[16,],1.5)
##D #use these parameters to fit surface ....
##D   lambda.MLE<- out$pars[3]/out$pars[1]
##D   out2<- Krig( ozone2$lon.lat,ozone2$y[16,] , Covariance="Matern",
##D               theta=out$pars[2], smoothness=1.5, lambda= lambda.MLE)
##D   surface( out2) # uses default lambda -- which is the right one.
##D 
##D # here is another way to do this where the new lambda is given in 
##D # the predict step
##D   out2<- Krig( ozone2$lon.lat,ozone2$y[16,] , Covariance="Matern",
##D                theta=out$pars[2], smoothness=1.5)
##D # The default lambda is that found by GCV
##D # predict on a grid but use the MLE value for lambda:
##D   out.p<- predictSurface(out2, lambda= lambda.MLE)
##D   surface(out.p) # same surface!
## End(Not run)

# One could also use mKrig with a fixed lambda to compute the surface. 

## Not run: 
##D # looping  through all the days of the ozone data set.
##D   data( ozone2)
##D   x<- ozone2$lon.lat
##D   y<- ozone2$y
##D   out.pars<- matrix( NA, ncol=3, nrow=89)
##D 
##D   for ( k in 1:89){
##D     hold<- MLE.Matern.fast( x,c(y[k,]), 1.5)$pars
##D     cat( "day", k," :", hold, fill=TRUE)
##D     out.pars[k,]<- hold }
## End(Not run)




