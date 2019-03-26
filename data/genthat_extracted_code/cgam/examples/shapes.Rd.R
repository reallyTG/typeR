library(cgam)


### Name: shapes
### Title: To Include a Non-Parametrically Modelled Predictor in a
###   SHAPESELECT Formula
### Aliases: shapes
### Keywords: variable selection routine

### ** Examples

## Not run: 
##D # Example 1.
##D   n <- 100 
##D    
##D   # generate predictors, x is non-parametrically modelled 
##D   # and z is parametrically modelled
##D   x <- runif(n)
##D   z <- rep(0:1, 50)
##D   
##D   # E(y) is generated as correlated to both x and z
##D   # the relationship between E(y) and x is smoothly increasing-convex
##D   y <- x^2 + 2 * I(z == 1) + rnorm(n, sd = 1)
##D 
##D   # call ShapeSelect to find the best model by the genetic algorithm
##D   fit <- ShapeSelect(y ~ shapes(x) + in.or.out(factor(z)), genetic = TRUE)
##D 
##D # Example 2.
##D   n <- 100
##D   z <- rep(c("A","B"), n / 2)
##D   x <- runif(n)
##D 
##D   # y0 is generated as correlated to z with a tree-ordering in it
##D   # y0 is smoothly increasing-convex in x
##D   y0 <- x^2 + I(z == "B") * 1.5
##D   y <- y0 + rnorm(n, 1)
##D 
##D   fit <- ShapeSelect(y ~ s.incr(x) + shapes(z, set = "tree"), genetic = FALSE)
##D   
##D   # check the best fit in terms of z
##D   fit$top
## End(Not run)



