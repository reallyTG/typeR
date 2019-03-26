library(GAMBoost)


### Name: optimGLMBoostPenalty
### Title: Coarse line search for adequate GLMBoost penalty parameter
### Aliases: optimGLMBoostPenalty
### Keywords: models regression

### ** Examples

## Not run: 
##D ##  Generate some data 
##D 
##D ##  Generate some data 
##D x <- matrix(runif(100*8,min=-1,max=1),100,8)             
##D eta <- -0.5 + 2*x[,1] + 4*x[,3]
##D y <- rbinom(100,1,binomial()$linkinv(eta))
##D 
##D ##  Find a penalty (starting from a large value, here: 5000) 
##D ##  that leads to an optimal number of boosting steps (based in AIC) 
##D ##  in the range [50,200] and return a GLMBoost fit with
##D ##  this penalty
##D 
##D opt.gb1 <- optimGLMBoostPenalty(x,y,minstepno=50,maxstepno=200,
##D                                 start.penalty=5000,family=binomial(),
##D                                 trace=TRUE)
##D 
##D #   extract the penalty found/used for the fit
##D opt.gb1$penalty
##D 
## End(Not run)




