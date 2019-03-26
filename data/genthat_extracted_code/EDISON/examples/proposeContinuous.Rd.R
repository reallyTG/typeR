library(EDISON)


### Name: proposeContinuous
### Title: Propose a new real hyperparameter value.
### Aliases: proposeContinuous

### ** Examples


# Previous parameter value
param = runif(1, 0, 1)

# Propose new value within range [0, 1], with proposal width 0.1
new.param = proposeContinuous(param, 0.1, 1)




