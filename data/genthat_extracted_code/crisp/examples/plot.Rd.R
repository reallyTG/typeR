library(crisp)


### Name: plot
### Title: Plots Fit from 'crisp' or 'crispCV'.
### Aliases: plot plot.crisp plot.crispCV

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
##D #plot the estimated relationships between two predictors and outcome
##D #do this for a specific fit
##D plot(crisp.out, lambda.index = 25)
##D #or for the fit chosen using cross-validation
##D plot(crispCV.out)
## End(Not run)



