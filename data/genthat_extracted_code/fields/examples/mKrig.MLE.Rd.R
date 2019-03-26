library(fields)


### Name: mKrig.MLE
### Title: Maximizes likelihood for the process marginal variance (rho) and
###   nugget standard deviation (sigma) parameters (e.g. lambda) over a
###   many covariance models or covariance parameter values.
### Aliases: mKrig.MLE mKrig.MLE.joint fastTps.MLE
### Keywords: Kriging MLE spatial

### ** Examples

# some synthetic data
  N<- 100
  set.seed(123)
  x<- matrix(runif(2*N), N,2)
  theta<- .2
  Sigma<-  Matern( rdist(x,x)/theta , smoothness=1.0)
  Sigma.5<- chol( Sigma)
  sigma<- .1
  M<-5 #  Five (5) independent spatial data sets
  F.true<- t( Sigma.5)%*% matrix( rnorm(N*M), N,M)
  Y<-  F.true +  sigma* matrix( rnorm(N*M), N,M)
# find MLE for lambda with range and smoothness fixed in Matern for first
# data set
  obj<- mKrig.MLE( x,Y[,1], Covariance="Matern", theta=.2, smoothness=1.0)
  obj$summary # take a look
  fit<- mKrig( x,Y[,1], Covariance="Matern", theta=.2,
                                   smoothness=1.0, lambda= obj$lambda.best) 
#
# search over the range parameter and use all 5 replications for combined
# likelihood
## Not run: 
##D   par.grid<- list( theta= seq(.1,.25,,6))
##D # default starting value for lambda is .02 subsequent ones use previous optimum.
##D   obj<- mKrig.MLE( x,Y, Covariance="Matern",lambda=c(.02,rep(NA,4)),
##D                                   smoothness=1.0, par.grid=par.grid)
## End(Not run)

#perform joint likelihood maximization over lambda and theta. 
#optim can get a bad answer with poor initial guesses.
set.seed(123)
obj<- mKrig.MLE.joint(x,Y[,1], 
                      cov.args=list(Covariance="Matern", smoothness=1.0), 
                      cov.params.guess=list(theta=.2), lambda.guess=.1)

#look at lnLik evaluations
obj$lnLik.eval

## Not run: 
##D #perform joint likelihood maximization over lambda, theta, and smoothness.  
##D #optim can get a bad answer with poor initial guesses.
##D set.seed(123)
##D obj<- mKrig.MLE.joint(x,Y[,1], 
##D                       cov.args=list(Covariance="Matern"), 
##D                       cov.params.guess=list(theta=.2, smoothness=1), lambda.guess=.1)
##D 
##D #look at lnLik evaluations
##D obj$lnLik.eval
##D 
##D #generate surface plot of results of joint likelihood maximization
##D #NOTE: mKrig.MLE.joint returns mKrig object while mKrig.MLE doesn't, 
##D #so this won't work for mKrig.MLE.
##D surface(obj)
## End(Not run)



