library(metaheuristicOpt)


### Name: FFA
### Title: Optimization using Firefly Algorithm
### Aliases: FFA

### ** Examples

################################## 
## Optimizing the sphere function

# define sphere function as objective function
sphere <- function(X){
    return(sum(X^2))
}

## Define parameter 
B0 <- 1
gamma <- 1
alpha <- 0.2
numVar <- 5
rangeVar <- matrix(c(-10,10), nrow=2)

## calculate the optimum solution using Firefly Algorithm
resultFFA <- FFA(sphere, optimType="MIN", numVar, numPopulation=20, 
                 maxIter=100, rangeVar, B0, gamma, alpha)

## calculate the optimum value using sphere function
optimum.value <- sphere(resultFFA)




