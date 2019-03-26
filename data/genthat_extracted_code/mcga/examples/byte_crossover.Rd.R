library(mcga)


### Name: byte_crossover
### Title: Performs crossover operation on a pair of two selected parent
###   candidate solutions
### Aliases: byte_crossover

### ** Examples

f <- function(x){ 
  return(-sum( (x-5)^2 ) )
}
myga <- GA::ga(type="real-valued", fitness = f, popSize = 100, maxiter = 200, 
              lower = rep(-50,5), upper = rep(50,5), crossover = byte_crossover,
              mutation = byte_mutation)
print(myga@solution)



