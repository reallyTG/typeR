library(greta)


### Name: greta
### Title: greta: simple and scalable statistical modelling in R
### Aliases: greta greta-package

### ** Examples

## Not run: 
##D # a simple Bayesian regression model for the iris data
##D 
##D # priors
##D int <- normal(0, 5)
##D coef <- normal(0, 3)
##D sd <- lognormal(0, 3)
##D 
##D # likelihood
##D mean <- int + coef * iris$Petal.Length
##D distribution(iris$Sepal.Length) <- normal(mean, sd)
##D 
##D # build and sample
##D m <- model(int, coef, sd)
##D draws <- mcmc(m, n_samples = 100)
## End(Not run)



