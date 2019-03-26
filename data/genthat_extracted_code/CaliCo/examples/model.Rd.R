library(CaliCo)


### Name: model
### Title: Generates 'model.class' objects.
### Aliases: model

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
##D ###### For the first model
##D ### Generate the model
##D model1 <- model(code,X,Yexp,"model1")
##D ### Plot the results with the first column of X
##D model1 %<% list(theta=c(1,1,11),var=0.01)
##D plot(model1,X[,1],CI="err")
##D 
##D ### Summury of the foo class generated
##D print(model1)
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
##D ### Plot the model
##D plot(model2,X[,1])
##D 
##D ### code function is available and use a specific DOE
##D DOE <- DiceDesign::lhsDesign(20,5)$design
##D DOE[,3:5] <- unscale(DOE[,3:5],binf,bsup)
##D 
##D opt.gp <- list(type="matern5_2", DOE=DOE)
##D model2 <- model(code,X,Yexp,"model2",
##D                 opt.gp=opt.gp)
##D model2 %<% list(theta=c(1,1,11),var=0.1)
##D plot(model2,X[,1])
##D 
##D ### no code function but DOE and code output available
##D Ysim <- matrix(nr=20,nc=1)
##D for (i in 1:20)
##D {
##D   covariates <- as.matrix(DOE[i,1:2])
##D   dim(covariates) <- c(1,2)
##D   Ysim[i] <- code(covariates,DOE[i,3:5])
##D }
##D 
##D opt.sim <- list(Ysim=Ysim,DOEsim=DOE)
##D opt.gp <- list(type="matern5_2", DOE=NULL)
##D model2 <- model(code=NULL,X,Yexp,"model2",
##D                 opt.gp=opt.gp,
##D                 opt.sim=opt.sim)
##D model2 %<% list(theta=c(1,1,11),var=0.1)
##D plot(model2,X[,1])
##D 
##D ###### For the third model
##D model3 <- model(code,X,Yexp,"model3",opt.disc=list(kernel.type="gauss"))
##D model3 %<% list(theta=c(1,1,11),thetaD=c(20,0.5),var=0.1)
##D plot(model3,X[,1],CI="err")
##D print(model3)
##D 
## End(Not run)




