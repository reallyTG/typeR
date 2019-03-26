library(bbo)


### Name: bbo
### Title: Biogeography-Based Optimization
### Aliases: bbo
### Keywords: bbo, Biogeography-Based Optimization, evolutionary algorithm

### ** Examples

	## --------------------
	## Rosenbrock function:
	## --------------------
	## It has a global minimum f(x) = 0 at (1,1).  
	## Kindly note that the first parameter passed to the 
	## objective function should be the vector of parameters
	## to be optimized.
	Rosenbrock <- function(x){
	  x1 <- x[1]
	  x2 <- x[2]
	  return(  100 * (x2 - x1 * x1)^2 + (1 - x1)^2 )
  	}

	bbo(Rosenbrock, -5, 5, control = 
		bbo.control(pMutate = 0.4, 
				numVar = 2, 
				popSize = 50, 
				KEEP = 5, 
				maxGen = 20))





