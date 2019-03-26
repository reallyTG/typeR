library(reglogit)


### Name: predict.reglogit
### Title: Prediction for regularized (polychotomous) logistic regression
###   models
### Aliases: predict.reglogit predict.regmlogit
### Keywords: models classif

### ** Examples

## see reglogit for a full example of binary classifiction complete with
## sampling from the posterior predictive distribution.  

## the example here is for polychotomous classification and prediction

## Not run: 
##D library(plgp)
##D x <- seq(-2, 2, length=40)
##D X <- expand.grid(x, x)
##D C <- exp2d.C(X)
##D xx <- seq(-2, 2, length=100)
##D XX <- expand.grid(xx, xx)
##D CC <- exp2d.C(XX)
##D 
##D ## build cubically-expanded design matrix (with interactions)
##D Xe <- cbind(X, X[,1]^2, X[,2]^2, X[,1]*X[,2],
##D             X[,1]^3, X[,2]^3, X[,1]^2*X[,2], X[,2]^2*X[,1],
##D             (X[,1]*X[,2])^2)
##D 
##D ## perform MCMC
##D T <- 1000
##D out <- regmlogit(T, C, Xe, nu=6, normalize=TRUE)
##D 
##D ## create predictive (cubically-expanded) design matrix
##D XX <- as.matrix(XX)
##D XXe <- cbind(XX, XX[,1]^2, XX[,2]^2, XX[,1]*XX[,2],
##D              XX[,1]^3, XX[,2]^3, XX[,1]^2*XX[,2], XX[,2]^2*XX[,1],
##D              (XX[,1]*XX[,2])^2)
##D 
##D ## predict class labels
##D p <- predict(out, XXe)
##D 
##D ## make an image of the predictive surface
##D cols <- c(gray(0.85), gray(0.625), gray(0.4))
##D par(mfrow=c(1,3))
##D image(xx, xx, matrix(CC, ncol=length(xx)), col=cols, main="truth")
##D image(xx, xx, matrix(p$c, ncol=length(xx)), col=cols, main="predicted")
##D image(xx, xx, matrix(p$ent, ncol=length(xx)), col=heat.colors(128),
##D       main="entropy")
## End(Not run)



