library(bdynsys)


### Name: phaseportdat
### Title: Phase Potrait with Data Trajectories for Specified Entities
### Aliases: phaseportdat
### Keywords: graphics

### ** Examples

## Phase Portrait with Data Trajectories with the following two models:
## dx/dt  = + 0.0012 /x^2 and dy/dt = + 0.0071 x^3

phaseportdat(datap, datap$logGDP, datap$EmanzV, seq(0, 1, by = 0.1), seq(0, 1, by = 0.1), 
f <- function(t,Y=c()) rbind(0.0012/Y[1]^2, + 0.0071*Y[1]^3), 1, 2, 4, 5, 7, 9)



