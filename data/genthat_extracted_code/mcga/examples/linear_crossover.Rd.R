library(mcga)


### Name: linear_crossover
### Title: Performs linear crossover operation on a pair of two selected
###   parent candidate solutions
### Aliases: linear_crossover

### ** Examples

f <- function(x){ 
  return(-sum( (x-5)^2 ) )
}
myga <- ga(type="real-valued", fitness = f, popSize = 100, maxiter = 100, 
           min = rep(-50,5), max = rep(50,5), crossover = linear_crossover)
print(myga@solution)



