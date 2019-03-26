library(metaheuristicOpt)


### Name: MFO
### Title: Optimization using Moth Flame Optimizer
### Aliases: MFO

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

## calculate the optimum solution using Moth Flame Optimizer
resultMFO <- MFO(sphere, optimType="MIN", numVar, numPopulation=20, 
                 maxIter=100, rangeVar)

## calculate the optimum value using sphere function
optimum.value <- sphere(resultMFO)




