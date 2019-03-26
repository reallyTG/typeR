library(mcga)


### Name: unfair_average_crossover
### Title: Performs unfair average crossover operation on a pair of two
###   selected parent candidate solutions
### Aliases: unfair_average_crossover

### ** Examples

f <- function(x){ 
  return(-sum( (x-5)^2 ) )
}
myga <- ga(type="real-valued", fitness = f, popSize = 100, maxiter = 100, 
           min = rep(-50,5), max = rep(50,5), crossover = unfair_average_crossover)
print(myga@solution)



