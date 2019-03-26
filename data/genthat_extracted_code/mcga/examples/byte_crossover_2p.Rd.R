library(mcga)


### Name: byte_crossover_2p
### Title: Performs two-point crossover operation on a pair of two selected
###   parent candidate solutions
### Aliases: byte_crossover_2p

### ** Examples

f <- function(x){ 
  return(-sum( (x-5)^2 ) )
}
myga <- GA::ga(type="real-valued", fitness = f, popSize = 100, maxiter = 200, 
              min = rep(-50,5), max = rep(50,5), crossover = byte_crossover_2p,
              mutation = byte_mutation)
print(myga@solution)



