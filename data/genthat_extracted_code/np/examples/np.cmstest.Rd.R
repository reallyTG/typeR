library(np)


### Name: npcmstest
### Title: Kernel Consistent Model Specification Test with Mixed Data Types
### Aliases: npcmstest
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # EXAMPLE 1: For this example, we conduct a consistent model
##D # specification test for a parametric wage regression model that is
##D # quadratic in age. The work of Murphy and Welch (1990) would suggest
##D # that this parametric regression model is misspecified.
##D 
##D data("cps71")
##D attach(cps71)
##D 
##D model <- lm(logwage~age+I(age^2), x=TRUE, y=TRUE)
##D 
##D plot(age, logwage)
##D lines(age, fitted(model))
##D 
##D # Note - this may take a few minutes depending on the speed of your
##D # computer...
##D 
##D npcmstest(model = model, xdat = age, ydat = logwage)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Next try Murphy & Welch's (1990) suggested quintic specification.
##D 
##D model <- lm(logwage~age+I(age^2)+I(age^3)+I(age^4)+I(age^5), x=TRUE, y=TRUE)
##D 
##D plot(age, logwage)
##D lines(age, fitted(model))
##D 
##D X <- data.frame(age)
##D 
##D # Note - this may take a few minutes depending on the speed of your
##D # computer...
##D 
##D npcmstest(model = model, xdat = age, ydat = logwage)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Note - you can pass in multiple arguments to this function. For
##D # instance, to use local linear rather than local constant regression, 
##D # you would use npcmstest(model, X, regtype="ll"), while you could also
##D # change the kernel type (default is second order Gaussian), numerical
##D # search tolerance, or feed in your own vector of bandwidths and so
##D # forth.
##D 
##D detach(cps71)
##D 
##D # EXAMPLE 2: For this example, we replicate the application in Maasoumi,
##D # Racine, and Stengos (2007) (see oecdpanel for details). We
##D # estimate a parametric model that is used in the literature, then
##D # subject it to the model specification test.
##D 
##D data("oecdpanel")
##D attach(oecdpanel)
##D 
##D model <- lm(growth ~ oecd +
##D             factor(year) +
##D             initgdp +
##D             I(initgdp^2) +
##D             I(initgdp^3) +
##D             I(initgdp^4) +
##D             popgro +
##D             inv +
##D             humancap +
##D             I(humancap^2) +
##D             I(humancap^3) - 1, 
##D             x=TRUE, 
##D             y=TRUE)
##D 
##D X <- data.frame(factor(oecd), factor(year), initgdp, popgro, inv, humancap)
##D 
##D npcmstest(model = model, xdat = X, ydat = growth)
##D 
##D detach(oecdpanel)
## End(Not run) 



