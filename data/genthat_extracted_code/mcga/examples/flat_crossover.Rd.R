library(mcga)


### Name: flat_crossover
### Title: Performs flat crossover operation on a pair of two selected
###   parent candidate solutions
### Aliases: flat_crossover

### ** Examples

f <- function(x){ 
  return(-sum( (x-5)^2 ) )
}
myga <- ga(type="real-valued", fitness = f, popSize = 100, maxiter = 100, 
           min = rep(-50,5), max = rep(50,5), crossover = flat_crossover)
print(myga@solution)



