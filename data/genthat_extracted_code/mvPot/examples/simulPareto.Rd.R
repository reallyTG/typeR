library(mvPot)


### Name: simulPareto
### Title: Simulate Pareto random vectors
### Aliases: simulPareto

### ** Examples

#Define variogram function
vario <- function(h){
   1 / 2 * norm(h,type = "2")^1.5
}

#Define locations
loc <- expand.grid(1:4, 1:4)

#Simulate data
obs <- simulPareto(100, loc, vario)



