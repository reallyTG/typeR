library(mcga)


### Name: mcga2
### Title: Performs a machine-coded genetic algorithm search for a given
###   optimization problem
### Aliases: mcga2

### ** Examples

f <- function(x){ 
  return(-sum( (x-5)^2 ) )
}
myga <- mcga2(fitness = f, popSize = 100, maxiter = 300, 
              min = rep(-50,5), max = rep(50,5))
print(myga@solution)



