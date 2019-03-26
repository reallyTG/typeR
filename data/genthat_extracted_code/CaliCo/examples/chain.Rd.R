library(CaliCo)


### Name: chain
### Title: Return the MCMC chain in a 'data.frame'
### Aliases: chain

### ** Examples

## Not run: 
##D ###################### The code to calibrate
##D X <- cbind(seq(0,1,length.out=10),seq(0,1,length.out=10))
##D code <- function(X,theta)
##D {
##D   return((6*X[,1]*theta[2]-2)^2*theta[1]*sin(theta[3]*X[,2]-4))
##D }
##D Yexp <- code(X,c(1,1,11))+rnorm(10,0,0.1)
##D 
##D ############### For the first model
##D ###### Definition of the model
##D md <- model(code,X,Yexp,"model1")
##D ###### Definition of the prior densities
##D pr <- prior(type.prior=c("gaussian","gaussian","gaussian","gamma"),opt.prior=
##D list(c(1,0.01),c(1,0.01),c(11,3),c(2,0.1)))
##D ###### Definition of the calibration options
##D opt.estim=list(Ngibbs=200,Nmh=600,thetaInit=c(1,1,11,0.1),r=c(0.3,0.3),
##D sig=diag(4),Nchains=1,burnIn=100)
##D ###### Run the calibration
##D mdfit <- calibrate(md,pr,opt.estim)
##D 
##D mcmc <- chain(mdfit)
##D ### Check coda object
##D is.mcmc(mcmc)
##D ### get all the chain
##D mcmc <- chain(mdfit,coda=FALSE)
##D head(mcmc)
##D 
##D ### Multi chains
##D opt.estim=list(Ngibbs=200,Nmh=600,thetaInit=c(1,1,11,0.1),r=c(0.3,0.3),
##D sig=diag(4),Nchains=2,burnIn=100)
##D ###### Run the calibration
##D mdfit2 <- calibrate(md,pr,opt.estim)
##D 
##D mcmc <- chain(mdfit2)
##D is.mcmc.list(mcmc)
## End(Not run)



