library(crisp)


### Name: crisp-package
### Title: crisp: A package for fitting a model that partitions the
###   covariate space into blocks in a data-adaptive way.
### Aliases: crisp-package

### ** Examples

## Not run: 
##D #general example illustrating all functions
##D #see specific function help pages for details of using each function
##D 
##D #generate data (using a very small 'n' for illustration purposes)
##D set.seed(1)
##D data <- sim.data(n = 15, scenario = 2)
##D #plot the mean model for the scenario from which we generated data
##D plot(data)
##D 
##D #fit model for a range of tuning parameters, i.e., lambda values
##D #lambda sequence is chosen automatically if not specified
##D crisp.out <- crisp(X = data$X, y = data$y)
##D #or fit model and select lambda using 2-fold cross-validation
##D #note: use larger 'n.fold' (e.g., 10) in practice
##D crispCV.out <- crispCV(X = data$X, y = data$y, n.fold = 2)
##D 
##D #summarize all of the fits
##D summary(crisp.out)
##D #or just summarize a single fit
##D #we examine the fit with an index of 25. that is, lambda of
##D crisp.out$lambda.seq[25]
##D summary(crisp.out, lambda.index = 25)
##D #lastly, we can summarize the fit chosen using cross-validation
##D summary(crispCV.out)
##D #and also plot the cross-validation error
##D plot(summary(crispCV.out))
##D #the lambda chosen by cross-validation is also available using
##D crispCV.out$lambda.cv
##D 
##D #plot the estimated relationships between two predictors and outcome
##D #do this for a specific fit
##D plot(crisp.out, lambda.index = 25)
##D #or for the fit chosen using cross-validation
##D plot(crispCV.out)
##D 
##D #we can make predictions for a covariate matrix with new observations
##D #new.X with 20 observations
##D new.data <- sim.data(n = 20, scenario = 2)
##D new.X <- new.data$X
##D #these will give the same predictions:
##D yhat1 <- predict(crisp.out, new.X = new.X, lambda.index = crispCV.out$index.cv)
##D yhat2 <- predict(crispCV.out, new.X = new.X)
## End(Not run)



