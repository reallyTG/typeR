library(merlin)


### Name: predict.merlin
### Title: predict.merlin - post-estimation tools for merlin
### Aliases: predict.merlin

### ** Examples

library(merlin)
data(pbc.merlin, package = "merlin")

# Linear fixed-effects model
mod <-merlin(model = list(logb ~ year),
             family = "gaussian",
             data = pbc.merlin)
predict(mod,stat="eta",type="fixedonly")




