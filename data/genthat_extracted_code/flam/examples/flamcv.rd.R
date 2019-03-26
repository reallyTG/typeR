library(flam)


### Name: flamCV
### Title: Fit the Fused Lasso Additive Model and Do Tuning Parameter
###   Selection using K-Fold Cross-Validation
### Aliases: flamCV

### ** Examples

#See ?'flam-package' for a full example of how to use this package

#generate data
set.seed(1)
data <- sim.data(n = 50, scenario = 1, zerof = 10, noise = 1)

#fit model for a range of lambda chosen by default
#pick lambda using 2-fold cross-validation
#note: use larger 'n.fold' (e.g., 10) in practice
flamCV.out <- flamCV(x = data$x, y = data$y, alpha = 0.75, n.fold = 2)

## Not run: 
##D #note that cross-validation is only done to choose lambda for specified alpha
##D #to cross-validate over alpha also, call 'flamCV' for several alpha and set seed
##D #note: use larger 'n.fold' (e.g., 10) in practice
##D flamCV.out1 <- flamCV(x = data$x, y = data$y, alpha = 0.65, seed = 100, 
##D 	within1SE = FALSE, n.fold = 2)
##D flamCV.out2 <- flamCV(x = data$x, y = data$y, alpha = 0.75, seed = 100, 
##D 	within1SE = FALSE, n.fold = 2)
##D flamCV.out3 <- flamCV(x = data$x, y = data$y, alpha = 0.85, seed = 100, 
##D 	within1SE = FALSE, n.fold = 2)
##D #this ensures that the folds used are the same
##D flamCV.out1$fold; flamCV.out2$fold; flamCV.out3$fold
##D #compare the CV error for the optimum lambda of each alpha to choose alpha
##D CVerrors <- c(flamCV.out1$mean.cv.error[flamCV.out1$index.cv], 
##D 	flamCV.out2$mean.cv.error[flamCV.out2$index.cv], 
##D 	flamCV.out3$mean.cv.error[flamCV.out3$index.cv])
##D best.alpha <- c(flamCV.out1$alpha, flamCV.out2$alpha, 
##D 	flamCV.out3$alpha)[which(CVerrors==min(CVerrors))]
##D 
##D #also can generate data for logistic FLAM model
##D data2 <- sim.data(n = 50, scenario = 1, zerof = 10, family = "binomial")
##D #fit the FLAM model with cross-validation using logistic loss
##D #note: use larger 'n.fold' (e.g., 10) in practice
##D flamCV.logistic.out <- flamCV(x = data2$x, y = data2$y, family = "binomial",
##D 	n.fold = 2)
## End(Not run)

#'flamCV' returns an object of the class 'flamCV' that includes an object
#of class 'flam' (flam.out); see ?'flam-package' for an example using S3
#methods for the classes of 'flam' and 'flamCV'



