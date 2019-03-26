library(DiceEval)


### Name: modelFit
### Title: Fitting metamodels
### Aliases: modelFit
### Keywords: models

### ** Examples

# A 2D example
Branin <- function(x1,x2) {
  x1 <- x1*15-5   
  x2 <- x2*15
  (x2 - 5/(4*pi^2)*(x1^2) + 5/pi*x1 - 6)^2 + 10*(1 - 1/(8*pi))*cos(x1) + 10
}
# a 2D uniform design and the value of the response at these points
X <- matrix(runif(24),ncol=2,nrow=12)
Z <- Branin(X[,1],X[,2])
Y <- (Z-mean(Z))/sd(Z)

# construction of a linear model
modLm <- modelFit(X,Y,type = "Linear",formula=Y~X1+X2+X1:X2+I(X1^2)+I(X2^2))
summary(modLm$model)

## Not run: 
##D # construction of a stepwise-selected model 
##D modStep <- modelFit(X,Y,type = "StepLinear",penalty=log(dim(X)[1]),
##D 		formula=Y~X1+X2+X1:X2+I(X1^2)+I(X2^2))
##D summary(modStep$model)
##D 
##D # construction of an additive model
##D library(gam)
##D modAm <- modelFit(X,Y,type = "Additive",formula=Y~s(X1)+s(X2))
##D summary(modAm$model)
##D 
##D # construction of a MARS model of degree 2
##D library(mda)
##D modMARS <- modelFit(X,Y,type = "MARS",degree=2)
##D print(modMARS$model)
##D 
##D # construction of a PolyMARS model with a penalty parameter equal to 1
##D library(polspline)
##D modPolyMARS <- modelFit(X,Y,type = "PolyMARS",gcv=1)
##D summary(modPolyMARS$model)
##D 
##D # construction of a Kriging model
##D modKm <- modelFit(X,Y,type = "Kriging")
##D str(modKm$model)
## End(Not run)



