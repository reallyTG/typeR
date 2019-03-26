library(cgam)


### Name: ShapeSelect
### Title: Variable and Shape Selection via Genetic Algorithm
### Aliases: ShapeSelect
### Keywords: variable and shape selection genetic algorithm

### ** Examples

## Not run: 
##D # Example 1.
##D   library(MASS)
##D   data(Rubber)
##D 
##D   # ShapeSelect can be used to go through all models to find the best model
##D   fit <- ShapeSelect(loss ~ shapes(hard, set = "s.9") + shapes(tens, set = "s.9"),
##D   data = Rubber, genetic = FALSE)
##D  
##D   # the user can also choose to find the best model by the genetic algorithm
##D   # given any total number of possible models
##D   fit <- ShapeSelect(loss ~ shapes(hard, set = "s.9") + shapes(tens, set = "s.9"),
##D   data = Rubber, genetic = TRUE)
##D 
##D   # check the best model
##D   fit$top
##D 
##D   # check the running time
##D   fit$tm
##D 
##D # Example 2.
##D   # simulate a data set such that the mean is smoothly increasing-convex in x1 and x2
##D   n <- 100
##D   x1 <- runif(n)
##D   x2 <- runif(n)
##D   y0 <-  x1^2 + x2 + x2^3
##D 
##D   z <- rep(0:1, 50)
##D   for (i in 1:n) {
##D     if (z[i] == 1) 
##D       y0[i] = y0[i] * 1.5
##D   }
##D 
##D   # add some random errors and call the routine
##D   y <- y0 + rnorm(n)
##D 
##D   # include factor(z) in the formula and determine if factor(z) should be in the model 
##D   fit <- ShapeSelect(y ~ shapes(x1, set = "s.9") + shapes(x2, set = "s.9") + in.or.out(factor(z)))
##D   
##D   # use the genetic algorithm
##D   fit <- ShapeSelect(y ~ shapes(x1, set = "s.9") + shapes(x2, set = "s.9") + in.or.out(factor(z)),
##D    npop = 300, per.mutate=0.02)
##D 
##D   # include z as a linear term in the formula and determine if z should be in the model 
##D   fit <- ShapeSelect(y ~ shapes(x1, set = "s.9") + shapes(x2, set = "s.9") + in.or.out(z))
##D 
##D   # include z as a linear term in the model 
##D   fit <- ShapeSelect(y ~ shapes(x1, set = "s.9") + shapes(x2, set = "s.9") + z)
##D 
##D   # include factor(z) in the model 
##D   fit <- ShapeSelect(y ~ shapes(x1, set = "s.9") + shapes(x2, set = "s.9") + factor(z))
##D 
##D   # check the best model
##D   bf <- fit$best.fit 
##D  
##D   # make a 3D plot of the best fit
##D   plotpersp(bf, categ = "z")
## End(Not run)



