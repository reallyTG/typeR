library(metaheuristicOpt)


### Name: GA
### Title: Optimization using Genetic Algorithm
### Aliases: GA

### ** Examples

################################## 
## Optimizing the sphere function

# define sphere function as objective function
sphere <- function(X){
    return(sum(X^2))
}

## Define parameter 
Pm <- 0.1
Pc <- 0.8
numVar <- 5
rangeVar <- matrix(c(-10,10), nrow=2)

## calculate the optimum solution using Genetic Algorithm 
resultGA <- GA(sphere, optimType="MIN", numVar, numPopulation=20, 
                 maxIter=100, rangeVar, Pm, Pc)

## calculate the optimum value using sphere function
optimum.value <- sphere(resultGA)




