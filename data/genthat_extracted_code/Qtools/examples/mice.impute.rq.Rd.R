library(Qtools)


### Name: mice.impute.rq
### Title: QR-based Multiple Imputation
### Aliases: mice.impute.rrq mice.impute.rq
### Keywords: multiple imputation conditional quantiles

### ** Examples


## Not run: 
##D 
##D # Load package 'mice'
##D require(mice)
##D 
##D # Load data nhanes
##D data(nhanes)
##D nhanes2 <- nhanes
##D nhanes2$hyp <- as.factor(nhanes2$hyp)
##D 
##D # Impute continuous variables using quantile regression
##D set.seed(199)
##D imp <- mice(nhanes2, meth = c("polyreg", "rq", "logreg", "rq"), m = 5)
##D 
##D # estimate linear regression and pool results
##D fit <- lm.mids(bmi ~ hyp + chl, data = imp)
##D pool(fit)
##D 
##D # Impute using restricted quantile regression
##D set.seed(199)
##D imp <- mice(nhanes2, meth = c("polyreg", "rrq", "logreg", "rrq"), m = 5)
##D fit <- lm.mids(bmi ~ hyp + chl, data = imp)
##D pool(fit)
##D 
##D # Impute using quantile regression + Box-Cox transformation with parameter
##D # lambda = 0 (ie, log transformation)
##D 
##D set.seed(199)
##D imp <- mice(nhanes2, meth = c("polyreg", "rq", "logreg", "rq"), m = 5, tsf = "bc", lambda = 0)
##D fit <- lm.mids(bmi ~ hyp + chl, data = imp)
##D pool(fit)
##D 
##D 
## End(Not run)




