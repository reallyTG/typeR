library(GAMBoost)


### Name: optimStepSizeFactor
### Title: Coarse line search for optimum step-size modification factor
### Aliases: optimStepSizeFactor
### Keywords: models smooth regression

### ** Examples

## Not run: 
##D ##  Generate some data 
##D n <- 100; p <- 10
##D 
##D #   covariates with non-linear (smooth) effects
##D x <- matrix(runif(n*p,min=-1,max=1),n,p)             
##D eta <- -0.5 + 2*x[,1] + 2*x[,3]^2 + x[,9]-.5
##D y <- rbinom(n,1,binomial()$linkinv(eta))
##D 
##D #  Determine step-size modification factor for a generalize linear model
##D #  As there is no connection matrix,  perform search into both directions 
##D 
##D optim.res <- optimStepSizeFactor(direction="both",
##D                                 y=y,x.linear=x,family=binomial(),
##D                                 penalty.linear=200,
##D                                 trace=TRUE)
##D 
##D #   Fit with obtained step-size modification parameter and optimal number of boosting
##D #   steps obtained by cross-validation
##D 
##D gb1 <- GAMBoost(x=NULL,y=y,x.linear=x,family=binomial(),penalty.linear=200,
##D                 stepno=optim.res$optimal.step,
##D                 stepsize.factor.linear=optim.res$optimal.factor) 
##D 
##D summary(gb1)
##D 
## End(Not run)




