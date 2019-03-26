library(mvPot)


### Name: simulBrownResnick
### Title: Simulation of Brown-Resnick random vectors
### Aliases: simulBrownResnick

### ** Examples

#Define semi-variogram function
vario <- function(h){
   1 / 2 * norm(h,type = "2")^1.5
}

#Define locations
loc <- expand.grid(1:4, 1:4)

#Simulate data
obs <- simulBrownResnick(10, loc, vario)



