library(mcga)


### Name: byte_mutation_random_dynamic
### Title: Performs mutation operation on a given double vector with
###   dynamic mutation probabilities
### Aliases: byte_mutation_random_dynamic

### ** Examples

f <- function(x){ 
  return(-sum( (x-5)^2 ) )
}
# Increase popSize and maxiter for more precise solutions
myga <- GA::ga(type="real-valued", fitness = f, popSize = 100, maxiter = 200, 
              min = rep(-50,5), max = rep(50,5), crossover = byte_crossover,
              mutation = byte_mutation_random_dynamic, pmutation = 0.20)
print(myga@solution)



