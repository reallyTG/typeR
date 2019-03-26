library(flam)


### Name: plot.flamCV
### Title: Plots Cross-Validation Curve for Object of Class "flamCV"
### Aliases: plot.flamCV

### ** Examples

#See ?'flam-package' for a full example of how to use this package

#generate data
set.seed(1)
data <- sim.data(n = 50, scenario = 1, zerof = 0, noise = 1)

#fit model and select tuning parameters using 2-fold cross-validation
#note: use larger 'n.fold' (e.g., 10) in practice
flamCV.out <- flamCV(x = data$x, y = data$y, within1SE = TRUE, n.fold = 2)

#lambdas chosen is
flamCV.out$lambda.cv

#we can now plot the cross-validation error curve with standard errors
#vertical dotted line at lambda chosen by cross-validation
plot(flamCV.out)
#or without standard errors
plot(flamCV.out, showSE = FALSE)

## Not run: 
##D #can choose lambda to be value with minimum CV error
##D #instead of lambda with CV error within 1 standard error of the minimum
##D flamCV.out2 <- flamCV(x = data$x, y = data$y, within1SE = FALSE, n.fold = 2)
##D 
##D #contrast to chosen lambda for minimum cross-validation error
##D #it's a less-regularized model (i.e., lambda is smaller)
##D plot(flamCV.out2)
## End(Not run)



