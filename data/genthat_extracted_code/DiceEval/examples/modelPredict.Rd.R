library(DiceEval)


### Name: modelPredict
### Title: Prediction at newdata for a fitted metamodel
### Aliases: modelPredict
### Keywords: models

### ** Examples

X  <- seq(-1,1,l=21)
Y  <- 3*X + rnorm(21,0,0.5)
# construction of a linear model
modLm <- modelFit(X,Y,type = "Linear",formula="Y~.")
print(modLm$model$coefficient)

## Not run: 
##D # illustration on a 2-dimensional example
##D Branin	<- function(x1,x2) {
##D x1	<- 1/2*(15*x1+5)   
##D x2	<- 15/2*(x2+1)
##D (x2 - 5.1/(4*pi^2)*(x1^2) + 5/pi*x1 - 6)^2 + 10*(1 - 1/(8*pi))*cos(x1) + 10
##D }
##D # A 2D uniform design with 20 points in [-1,1]^2
##D n	<- 20
##D X	<- matrix(runif(n*2,-1,1),ncol=2,nrow=n)
##D Y	<- Branin(X[,1],X[,2])
##D Z	<- (Y-mean(Y))/sd(Y)
##D 
##D # Construction of a Kriging model
##D mKm	<- modelFit(X,Z,type = "Kriging")
##D 
##D # Prediction and comparison between the exact function and the predicted one
##D xtest	<- seq(-1, 1, length= 21) 
##D ytest	<- seq(-1, 1, length= 21)
##D Zreal	<- outer(xtest, ytest, Branin)
##D Zreal	<- (Zreal-mean(Y))/sd(Y)
##D Zpredict	<- modelPredict(mKm,expand.grid(xtest,ytest))
##D 
##D z <- abs(Zreal-matrix(Zpredict,nrow=length(xtest),ncol=length(ytest)))
##D contour(xtest, xtest, z,30)
##D points(X,pch=19)
## End(Not run)



