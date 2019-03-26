library(metaheuristicOpt)


### Name: metaOpt
### Title: metaOpt The main function to execute algorithms for getting
###   optimal solutions
### Aliases: metaOpt

### ** Examples

################################## 
## Optimizing the sphere function

## Define sphere function as an objective function 
sphere <- function(X){
    return(sum(X^2))
}

## Define control variable 
control <- list(numPopulation=40, maxIter=100, Vmax=2, ci=1.49445, cg=1.49445, w=0.729)

numVar <- 5
rangeVar <- matrix(c(-10,10), nrow=2)

## Define control variable 
best.variable <- metaOpt(sphere, optimType="MIN", algorithm="PSO", numVar, 
                         rangeVar, control)




