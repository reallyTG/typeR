library(metaheuristicOpt)


### Name: ALO
### Title: Optimization using Ant Lion Optimizer
### Aliases: ALO

### ** Examples

################################## 
## Optimizing the sphere function

# define sphere function as objective function
sphere <- function(X){
    return(sum(X^2))
}

## Define parameter 
numVar <- 5
rangeVar <- matrix(c(-10,10), nrow=2)

## calculate the optimum solution using Ant Lion Optimizer 
resultALO <- ALO(sphere, optimType="MIN", numVar, numPopulation=20, 
                 maxIter=100, rangeVar)

## calculate the optimum value using sphere function
optimum.value <- sphere(resultALO)




