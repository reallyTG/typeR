library(crisp)


### Name: predict
### Title: Predicts Observations for a New Covariate Matrix using Fit from
###   'crisp' or 'crispCV'.
### Aliases: predict predict.crisp predict.crispCV

### ** Examples

## Not run: 
##D #See ?'crisp-package' for a full example of how to use this package
##D 
##D #generate data (using a very small 'n' for illustration purposes)
##D set.seed(1)
##D data <- sim.data(n = 15, scenario = 2)
##D 
##D #fit model for a range of tuning parameters, i.e., lambda values
##D #lambda sequence is chosen automatically if not specified
##D crisp.out <- crisp(X = data$X, y = data$y)
##D #or fit model and select lambda using 2-fold cross-validation
##D #note: use larger 'n.fold' (e.g., 10) in practice
##D crispCV.out <- crispCV(X = data$X, y = data$y, n.fold = 2)
##D 
##D #we can make predictions for a covariate matrix with new observations
##D #new.X with 20 observations
##D new.data <- sim.data(n = 20, scenario = 2)
##D new.X <- new.data$X
##D #these will give the same predictions:
##D yhat1 <- predict(crisp.out, new.X = new.X, lambda.index = crispCV.out$index.cv)
##D yhat2 <- predict(crispCV.out, new.X = new.X)
## End(Not run)



