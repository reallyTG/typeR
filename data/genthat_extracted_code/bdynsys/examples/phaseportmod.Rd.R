library(bdynsys)


### Name: phaseportmod
### Title: Phase Potrait with Modeled Trajectories for Specified Entities
### Aliases: phaseportmod
### Keywords: graphics

### ** Examples

## Phase Portrait with Model Trajectories over 30 years with the following two models:
## dx/dt  = 0.014 + 0.0064*x*y - 0.02*x and dy/dt = 0.106*x^3 - 0.062*y/x

phaseportmod(datap, 30, datap$logGDP, datap$DemocrH, seq(0, 1, by = 0.01), seq(0, 1, by = 0.01),
param <- c(0.014, -0.0064, -0.02, 0.106, -0.062), f <- function(t,Y=c()) 
rbind(0.014 + 0.0064*Y[1]*Y[2] - 0.02*Y[1], 0.106*Y[1]^3 - 0.062*(Y[2]/Y[1])), 1, 2, 4, 5, 7, 9)



