library(OutlierDC)


### Name: OutlierDC-package
### Title: Functions for detecting outlying observations for censored data
###   using quantile regression
### Aliases: OutlierDC OutlierDC-package
### Keywords: package

### ** Examples

  ## Not run: 
##D     require(OutlierDC)
##D     # Toy example 
##D     data(ebd)
##D     # The data consists of 402 observations with 6 variables. 
##D     dim(ebd)
##D     # To show the first six observations of the dataset,
##D     head(ebd)
##D     
##D     #scoring algorithm
##D     fit <- odc(Surv(log(time), status) ~ meta, data = ebd)
##D     fit
##D     coef(fit)
##D     plot(fit)
##D 
##D     # Add upper bound for the selection of outleirs
##D     fit1 <- update(fit, k_s = 4)
##D     fit1
##D     plot(fit1)
##D 
##D     # residual-based algorithm
##D     fit2 <- odc(Surv(log(time), status) ~ meta, data = ebd, method = "residual", k_r = 1.5)
##D     fit2
##D     plot(fit2)
##D     
##D     # To display all of outlying observations in the fitted object
##D     fit2@outlier.data
##D     
##D     # boxplot algorithm
##D     fit3 <- odc(Surv(log(time), status) ~ meta, data = ebd, method = "boxplot", k_b = 1.5)
##D     fit3
##D     plot(fit3, ylab = "log survival times", xlab = "metastasis lymph nodes")
## End(Not run)



