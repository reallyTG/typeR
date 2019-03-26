library(earth)


### Name: plot.varmod
### Title: Plot a varmod object (created by calling earth with the varmod
###   argument)
### Aliases: plot.varmod

### ** Examples

data(ozone1)

set.seed(1) # optional, for cross validation reproducibility

# note: should really use ncross=30 below but for a quick demo we don't

earth.mod <- earth(O3~temp, data=ozone1, nfold=10, ncross=3, varmod.method="lm")

plot(earth.mod$varmod) # plot the embedded variance model (this calls plot.varmod)



