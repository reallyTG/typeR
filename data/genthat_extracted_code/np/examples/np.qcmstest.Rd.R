library(np)


### Name: npqcmstest
### Title: Kernel Consistent Quantile Regression Model Specification Test
###   with Mixed Data Types
### Aliases: npqcmstest
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # EXAMPLE 1: For this example, we conduct a consistent quantile regression
##D # model specification test for a parametric wage quantile regression
##D # model that is quadratic in age. The work of Murphy and Welch (1990)
##D # would suggest that this parametric quantile regression model is
##D # misspecified.
##D 
##D library("quantreg")
##D 
##D data("cps71")
##D attach(cps71)
##D 
##D model <- rq(logwage~age+I(age^2), tau=0.5, model=TRUE)
##D 
##D plot(age, logwage)
##D lines(age, fitted(model))
##D 
##D X <- data.frame(age)
##D 
##D # Note - this may take a few minutes depending on the speed of your
##D # computer...
##D 
##D npqcmstest(model = model, xdat = X, ydat = logwage, tau=0.5)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Next try Murphy & Welch's (1990) suggested quintic specification.
##D 
##D model <- rq(logwage~age+I(age^2)+I(age^3)+I(age^4)+I(age^5), model=TRUE)
##D 
##D plot(age, logwage)
##D lines(age, fitted(model))
##D 
##D X <- data.frame(age)
##D 
##D # Note - this may take a few minutes depending on the speed of your
##D # computer...
##D 
##D npqcmstest(model = model, xdat = X, ydat = logwage, tau=0.5)
##D 
##D detach(cps71)
## End(Not run) 



