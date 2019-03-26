library(DiceEval)


### Name: testCrossValidation
### Title: Test the robustess of the cross-validation procedure
### Aliases: testCrossValidation
### Keywords: models

### ** Examples

## Not run: 
##D rm(list=ls())
##D # A 2D example
##D Branin <- function(x1,x2) {
##D   x1 <- x1*15-5   
##D   x2 <- x2*15
##D   (x2 - 5/(4*pi^2)*(x1^2) + 5/pi*x1 - 6)^2 + 10*(1 - 1/(8*pi))*cos(x1) + 10
##D }
##D # a 2D uniform design and the value of the response at these points
##D n <- 50
##D X <- matrix(runif(n*2),ncol=2,nrow=n)
##D Y <- Branin(X[,1],X[,2])
##D 
##D mod <- modelFit(X,Y,type="Linear",formula=formulaLm(X,Y))
##D out <- testCrossValidation(mod,N=20)
## End(Not run)



