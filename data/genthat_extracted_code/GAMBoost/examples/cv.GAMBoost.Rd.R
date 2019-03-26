library(GAMBoost)


### Name: cv.GAMBoost
### Title: Cross-validation for GAMBoost fits
### Aliases: cv.GAMBoost
### Keywords: models smooth regression

### ** Examples

## Not run: 
##D ##  Generate some data 
##D 
##D x <- matrix(runif(100*8,min=-1,max=1),100,8)             
##D eta <- -0.5 + 2*x[,1] + 2*x[,3]^2
##D y <- rbinom(100,1,binomial()$linkinv(eta))
##D 
##D ##  Fit the model with smooth components
##D 
##D gb1 <- GAMBoost(x,y,penalty=400,stepno=100,trace=TRUE,family=binomial()) 
##D 
##D ##  10-fold cross-validation with prediction error as a criterion
##D 
##D gb1.crit <- cv.GAMBoost(x,y,penalty=400,maxstepno=100,trace=TRUE,
##D                         family=binomial(),
##D                         K=10,type="error",just.criterion=TRUE)
##D 
##D ##  Compare AIC and estimated prediction error
##D 
##D which.min(gb1$AIC)          
##D which.min(gb1.crit$criterion)
## End(Not run)




