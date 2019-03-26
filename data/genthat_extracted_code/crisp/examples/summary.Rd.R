library(crisp)


### Name: summary
### Title: Summarizes Fit from 'crisp' or 'crispCV'.
### Aliases: summary summary.crisp summary.crispCV

### ** Examples

## Not run: 
##D #See ?'crisp-package' for a full example of how to use this package
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
##D #summarize all of the fits
##D summary(crisp.out)
##D #or just summarize a single fit
##D #we examine the fit with an index of 25. that is, lambda of
##D crisp.out$lambda.seq[25]
##D summary(crisp.out, lambda.index = 25)
##D #lastly, we can summarize the fit chosen using cross-validation
##D summary(crispCV.out)
## End(Not run)



