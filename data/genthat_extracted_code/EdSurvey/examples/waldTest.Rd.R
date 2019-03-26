library(EdSurvey)


### Name: waldTest
### Title: Wald Tests
### Aliases: waldTest

### ** Examples

## Not run: 
##D # read in the example data (generated, not real student data)
##D sdf <- readNAEP(system.file("extdata/data", "M36NT2PM.dat", package = "NAEPprimer"))
##D 
##D # example with glm model
##D myLogit <- logit.sdf(dsex ~ b017451 + b003501, data = sdf, returnVarEstInputs = T)
##D 
##D # single coefficient integer
##D waldTest(model = myLogit, coefficients = 2)
##D 
##D # set of coefficients integer vector
##D waldTest(model = myLogit, coefficients = 2:5)
##D 
##D # specify levels of factor variable to test
##D waldTest(myLogit, c("b017451Every day", "b017451About once a week"))
##D 
##D # specify all levels of factor variable to test
##D waldTest(myLogit, "b017451")
##D 
##D # example with lm model
##D fit <- lm.sdf(composite ~ dsex + b017451, data = sdf, returnVarEstInputs = T)
##D 
##D waldTest(model = fit, coefficients = "b017451")
##D 
##D # examples with alternative (nonzero) null hypothesis values
##D waldTest(model = myLogit, coefficients = 2, H0 = 0.5)
##D 
##D waldTest(model = myLogit, coefficients = 2:5, H0 = c(0.5, 0.6, 0.7, 0.8))
##D 
##D waldTest(model = myLogit, coefficients = "b017451", H0 = c(0.5, 0.6, 0.7, 0.8))
##D 
##D waldTest(model = myLogit, coefficients = c("b017451Every day", "b017451About once a week"),
##D          H0 = c(0.1, 0.2))
## End(Not run)



