library(EDISON)


### Name: ProposeDiscrete
### Title: Propose a new discrete value.
### Aliases: ProposeDiscrete

### ** Examples


# Previous parameter value
param = rpois(1, 5)

# Propose new value within range [0, 10], with proposal width 2
new.param = ProposeDiscrete(param, 2, 10)




