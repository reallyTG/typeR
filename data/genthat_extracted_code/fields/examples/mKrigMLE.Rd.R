library(fields)


### Name: mKrigMLE
### Title: Maximizes likelihood for the process marginal variance (rho) and
###   nugget standard deviation (sigma) parameters (e.g. lambda) over a
###   many covariance models or covariance parameter values.
### Aliases: mKrigMLEJoint mKrigMLEGrid fastTpsMLE mKrigJointTemp.fn
### Keywords: spatial

### ** Examples

#perform joint likelihood maximization over lambda and theta. 
#optim can get a bad answer with poor initial starts.
data(ozone2)
x<- ozone2$lon.lat
y<- ozone2$y[16,]
obj<- mKrigMLEJoint(x,y, 
                      cov.args=list(Covariance="Matern", smoothness=1.0), 
                      cov.params.start=list(theta=.2), lambda.start=.1)
#                      
# check  lnLikeihood evaluations that were culled from optim
# these are in obj$lnLike.eval
# funny ranges are set to avoid  very low likelihood values

quilt.plot( log10(cbind(obj$lnLike.eval[,1:2])), obj$lnLike.eval[,5],
             xlim=c(-1.2,-.40), ylim=c( -1,1), zlim=c( -625, -610))
             points( log10(obj$pars.MLE[1]), log10(obj$pars.MLE[2]),
	     pch=16, col="grey" )

# some synthetic data with replicates
  N<- 50
  set.seed(123)
  x<- matrix(runif(2*N), N,2)
  theta<- .2
  Sigma<-  Matern( rdist(x,x)/theta , smoothness=1.0)
  Sigma.5<- chol( Sigma)
  sigma<- .1
  #  250 independent spatial data sets but a common covariance function 
  #    -- there is little overhead in
  #        MLE across independent realizations and a good test of code validity.
  M<-250
  #F.true<- t( Sigma.5)%*% matrix( rnorm(N*M), N,M)  
  F.true<- t( Sigma.5)%*% matrix( rnorm(N*M), N,M)
  Y<-  F.true +  sigma* matrix( rnorm(N*M), N,M)

# find MLE for lambda with grid of ranges 
# and smoothness fixed in Matern                     
 par.grid<- list( theta= seq( .1,.35,,8))
  obj1b<- mKrigMLEGrid( x,Y,
     cov.args = list(Covariance="Matern", smoothness=1.0), 
        par.grid = par.grid
                    )
  obj$summary # take a look
# profile over theta
  plot( par.grid$theta, obj1b$summary[,"lnProfileLike.FULL"],
    type="b", log="x")
  
  ## Not run: 
##D # m=0 is a simple switch to indicate _no_ fixed spatial drift
##D # (the default and highly recommended  is linear drift, m=2). 
##D # this results in MLEs that are less biased -- in fact it nails it !
##D   obj1a<- mKrigMLEJoint(x,Y, 
##D                     cov.args=list(Covariance="Matern", smoothness=1.0), 
##D                     cov.params.start=list(theta=.5), lambda.start=.5,
##D                      mKrig.args= list( m=0))
##D  
##D  test.for.zero( obj1a$summary["sigmaMLE"], sigma, tol=.0075)
##D  test.for.zero( obj1a$summary["theta"], theta, tol=.05)
## End(Not run) 

## Not run: 
##D #perform joint likelihood maximization over lambda, theta, and smoothness.  
##D #optim can get a bad answer with poor initial guesses.
##D obj2<- mKrigMLEJoint(x,Y, 
##D                       cov.args=list(Covariance="Matern", smoothness=1), 
##D                       cov.params.start=list(theta=.2),
##D                        lambda.start=.1)
##D 
##D #look at lnLikelihood  evaluations
##D obj2$summary
##D #compare to REML
##D obj3<- mKrigMLEJoint(x,Y, 
##D                       cov.args=list(Covariance="Matern", smoothness=1), 
##D                       cov.params.start=list(theta=.2),
##D                        lambda.start=.1, REML=TRUE)
## End(Not run)
## Not run: 
##D #look at lnLikelihood  evaluations
##D obj3$summary
##D # check convergence of MLE to true fit with no fixed part
##D # 
##D obj4<- mKrigMLEJoint(x,Y, 
##D                       mKrig.args= list( m=0),
##D                       cov.args=list(Covariance="Matern", smoothness=1), 
##D                       cov.params.start=list(theta=.2),
##D                        lambda.start=.1, REML=TRUE)
##D #look at lnLikelihood  evaluations
##D obj4$summary
##D # nails it!
## End(Not run)



