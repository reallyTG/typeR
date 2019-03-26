library(GAMBoost)


### Name: cv.GLMBoost
### Title: Cross-validation for GLMBoost fits
### Aliases: cv.GLMBoost
### Keywords: models regression

### ** Examples

## Not run: 
##D ##  Generate some data 
##D x <- matrix(runif(100*8,min=-1,max=1),100,8)             
##D eta <- -0.5 + 2*x[,1] + 4*x[,3]
##D y <- rbinom(100,1,binomial()$linkinv(eta))
##D 
##D ##  Fit the model with only linear components
##D gb1 <- GLMBoost(x,y,penalty=100,stepno=100,trace=TRUE,family=binomial()) 
##D 
##D 
##D ##  10-fold cross-validation with prediction error as a criterion
##D gb1.crit <- cv.GLMBoost(x,y,penalty=100,maxstepno=100,trace=TRUE,
##D                         family=binomial(),
##D                         K=10,type="error")
##D 
##D ##  Compare AIC and estimated prediction error
##D 
##D which.min(gb1$AIC)          
##D which.min(gb1.crit$criterion)
## End(Not run)




