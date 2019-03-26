library(merlin)


### Name: merlin_util_ev_deriv
### Title: merlin_util_ev_deriv - returns the first derivative with respect
###   to time of the observation-level expected value of the outcome
### Aliases: merlin_util_ev_deriv

### ** Examples

library(merlin)
data(pbc.merlin, package = "merlin")

# Linear fixed-effects model
merlin(model = list(logb ~ year),
       family = "gaussian",
       data = pbc.merlin)



