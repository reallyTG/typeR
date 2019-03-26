library(merlin)


### Name: merlin_util_xzb
### Title: merlin_util_xzb - returns the observation-level complex
###   predictor
### Aliases: merlin_util_xzb

### ** Examples

library(merlin)
data(pbc.merlin, package = "merlin")

# Linear fixed-effects model
merlin(model = list(logb ~ year),
       family = "gaussian",
       data = pbc.merlin)



