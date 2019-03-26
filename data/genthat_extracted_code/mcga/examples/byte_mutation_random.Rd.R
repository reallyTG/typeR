library(mcga)


### Name: byte_mutation_random
### Title: Performs mutation operation on a given double vector
### Aliases: byte_mutation_random

### ** Examples

f <- function(x){ 
  return(-sum( (x-5)^2 ) )
}
myga <- GA::ga(type="real-valued", fitness = f, popSize = 100, maxiter = 200, 
              min = rep(-50,5), max = rep(50,5), crossover = byte_crossover,
              mutation = byte_mutation_random, pmutation = 0.20)
print(myga@solution)



