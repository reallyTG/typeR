library(metaheuristicOpt)


### Name: PSO
### Title: Optimization using Prticle Swarm Optimization
### Aliases: PSO

### ** Examples

################################## 
## Optimizing the sphere function

# define sphere function as objective function
sphere <- function(X){
    return(sum(X^2))
}

## Define parameter 
Vmax <- 2
ci <- 1.5
cg <- 1.5
w <- 0.7
numVar <- 5
rangeVar <- matrix(c(-10,10), nrow=2)

## calculate the optimum solution using Particle Swarm Optimization Algorithm
resultPSO <- PSO(sphere, optimType="MIN", numVar, numPopulation=20, 
                 maxIter=100, rangeVar, Vmax, ci, cg, w)

## calculate the optimum value using sphere function
optimum.value <- sphere(resultPSO)




