library(CaliCo)


### Name: sequentialDesign
### Title: Calibration with a sequential design
### Aliases: sequentialDesign

### ** Examples

## Not run: 
##D ###### The code to calibrate
##D X <- cbind(seq(0,1,length.out=5),seq(0,1,length.out=5))
##D code <- function(X,theta)
##D {
##D   return((6*X[,1]*theta[2]-2)^2*theta[1]*sin(theta[3]*X[,2]-4))
##D }
##D Yexp <- code(X,c(1,1,11))+rnorm(5,0,0.1)
##D 
##D ###### For the second model
##D ### code function is available, no DOE generated upstream
##D binf <- c(0.9,0.9,10.5)
##D bsup <- c(1.1,1.1,11.5)
##D opt.gp <- list(type="matern5_2", DOE=NULL)
##D opt.emul <- list(p=3,n.emul=150,binf=binf,bsup=bsup,type="maximinLHS")
##D model2 <- model(code,X,Yexp,"model2",
##D                 opt.gp=opt.gp,
##D                 opt.emul=opt.emul)
##D model2 %<% list(theta=c(1,1,11),var=0.1)
##D 
##D pr <- prior(type.prior=c("gaussian","gaussian","gaussian","gamma"),opt.prior=
##D list(c(1,0.01),c(1,0.01),c(11,3),c(2,0.1)))
##D ###### Definition of the calibration options
##D opt.estim=list(Ngibbs=200,Nmh=400,thetaInit=c(1,1,11,0.1),r=c(0.3,0.3),
##D sig=diag(4),Nchains=1,burnIn=100)
##D ###### Run the sequential calibration
##D mdfit <- sequentialDesign(model2,pr,opt.estim,2)
##D #plot(mdfit,X[,1])
## End(Not run)



