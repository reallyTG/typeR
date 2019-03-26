library(BradleyTerry2)


### Name: glmmPQL.control
### Title: Control Aspects of the glmmPQL Algorithm
### Aliases: glmmPQL.control
### Keywords: models

### ** Examples


## Variation on example(flatlizards)
result <- rep(1, nrow(flatlizards$contests))

## BTm passes arguments on to glmmPQL.control()
args(BTm)
BTmodel <- BTm(result, winner, loser, ~ throat.PC1[..] + throat.PC3[..] +
               head.length[..] + SVL[..] + (1|..),
               data = flatlizards, tol = 1e-3, trace = TRUE)
summary(BTmodel)




