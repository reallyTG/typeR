library(metaheuristicOpt)


### Name: HS
### Title: Optimization using Harmony Search Algorithm
### Aliases: HS

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
PAR <- 0.3
HMCR <- 0.95
bandwith <- 0.05

## calculate the optimum solution using Harmony Search algorithm
resultHS <- HS(sphere, optimType="MIN", numVar, numPopulation=20, 
                 maxIter=100, rangeVar, PAR, HMCR, bandwith)

## calculate the optimum value using sphere function
optimum.value <- sphere(resultHS)




