library(bbo)


### Name: bbo-methods
### Title: bbo-methods
### Aliases: bbo-methods summary.bbo summary,bbo-method plot.bbo
###   plot,bbo-method
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

        sample.output.of.bbo <- bbo(Rosenbrock, -5, 5, 
					DisplayFlag = FALSE, 
					control = bbo.control(pMutate = 0.4, 
								numVar = 2, 
								popSize = 50, 
								KEEP = 5, 
								maxGen = 20))

	## print the output information
	bbo:::summary.bbo(sample.output.of.bbo)

	## plot
	bbo:::plot.bbo(sample.output.of.bbo, plot.type = "itersBestValue")



