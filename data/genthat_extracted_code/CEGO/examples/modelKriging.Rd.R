library(CEGO)


### Name: modelKriging
### Title: Kriging Model
### Aliases: modelKriging

### ** Examples

# Set random number generator seed
set.seed(1)
# Simple test landscape
fn <- landscapeGeneratorUNI(1:5,distancePermutationHamming)
# Generate data for training and test
x <- unique(replicate(40,sample(5),FALSE))
xtest <- x[-(1:15)]
x <- x[1:15]
# Determin true objective function values
y <- fn(x)
ytest <- fn(xtest)
# Build model
fit <- modelKriging(x,y,distancePermutationHamming,
    control=list(algThetaControl=list(method="L-BFGS-B"),useLambda=FALSE))
# Predicted obj. function values
ypred <- predict(fit,xtest)$y
# Uncertainty estimate
fit$predAll <- TRUE
spred <- predict(fit,xtest)$s
# Plot
plot(ytest,ypred,xlab="true value",ylab="predicted value",
    pch=20,xlim=c(0.3,1),ylim=c(min(ypred)-0.1,max(ypred)+0.1))
segments(ytest, ypred-spred,ytest, ypred+spred)
epsilon = 0.02
segments(ytest-epsilon,ypred-spred,ytest+epsilon,ypred-spred)
segments(ytest-epsilon,ypred+spred,ytest+epsilon,ypred+spred)
abline(0,1,lty=2)
# Use a different/custom optimizer (here: SANN) for maximum likelihood estimation: 
# (Note: Bound constraints are recommended, to avoid Inf values.
# This is really just a demonstration. SANN does not respect bound constraints.)
optimizer1 <- function(x,fun,lower=NULL,upper=NULL,control=NULL,...){
  res <- optim(x,fun,method="SANN",control=list(maxit=100),...)
  list(xbest=res$par,ybest=res$value,count=res$counts)
}
fit <- modelKriging(x,y,distancePermutationHamming,
                   control=list(algTheta=optimizer1,useLambda=FALSE))
#One-dimensional optimizer (Brent). Note, that Brent will not work when 
#several parameters have to be set, e.g., when using nugget effect (lambda).
#However, Brent may be quite efficient otherwise.
optimizer2 <- function(x,fun,lower,upper,control=NULL,...){
 res <- optim(x,fun,method="Brent",lower=lower,upper=upper,...)
 list(xbest=res$par,ybest=res$value,count=res$counts)
}
fit <- modelKriging(x,y,distancePermutationHamming,
                    control=list(algTheta=optimizer2,useLambda=FALSE))



