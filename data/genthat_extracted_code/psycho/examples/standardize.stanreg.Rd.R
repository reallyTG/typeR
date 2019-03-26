library(psycho)


### Name: standardize.stanreg
### Title: Standardize Posteriors.
### Aliases: standardize.stanreg

### ** Examples

## Not run: 
##D library(psycho)
##D library(rstanarm)
##D 
##D fit <- rstanarm::stan_glm(Sepal.Length ~ Sepal.Width * Species, data = iris)
##D fit <- rstanarm::stan_glm(Sepal.Length ~ Sepal.Width * Species, data = standardize(iris))
##D posteriors <- standardize(fit)
##D posteriors <- standardize(fit, method = "posterior")
## End(Not run)




