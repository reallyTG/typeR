library(greta)


### Name: model
### Title: greta model objects
### Aliases: model print.greta_model plot.greta_model

### ** Examples

## Not run: 
##D 
##D # define a simple model
##D mu <- variable()
##D sigma <- normal(0, 3, truncation = c(0, Inf))
##D x <- rnorm(10)
##D distribution(x) <- normal(mu, sigma)
##D 
##D m <- model(mu, sigma)
##D 
##D plot(m)
## End(Not run)



