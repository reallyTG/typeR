library(pomp)


### Name: Utilities for reproducibility
### Title: Tools for reproducible computations.
### Aliases: bake stew freeze

### ** Examples

  ## Not run: 
##D   bake(file="example1.rds",{
##D     x <- runif(1000)
##D     mean(x)
##D   })
##D 
##D   stew(file="example2.rda",{
##D     x <- runif(10)
##D     y <- rnorm(n=10,mean=3*x+5,sd=2)
##D   })
##D 
##D   plot(x,y)
##D   
## End(Not run)

  freeze(runif(3),seed=5886730)
  freeze(runif(3),seed=5886730)



