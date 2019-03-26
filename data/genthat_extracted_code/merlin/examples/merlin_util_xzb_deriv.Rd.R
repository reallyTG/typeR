library(merlin)


### Name: merlin_util_xzb_deriv
### Title: merlin_util_xzb_deriv - returns the first derivative with
###   respect to time of the observation-level complex predictor
### Aliases: merlin_util_xzb_deriv

### ** Examples

library(merlin)
data(pbc.merlin, package = "merlin")

# Linear fixed-effects model
merlin(model = list(logb ~ year),
       family = "gaussian",
       data = pbc.merlin)



