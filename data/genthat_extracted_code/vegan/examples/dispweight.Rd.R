library(vegan)


### Name: dispweight
### Title: Dispersion-based weighting of species counts
### Aliases: dispweight gdispweight summary.dispweight
### Keywords: multivariate manip

### ** Examples

data(mite, mite.env)
## dispweight and its summary
mite.dw <- with(mite.env, dispweight(mite, Shrub, nsimul = 99))
summary(mite.dw)
## generalized dispersion weighting
mite.dw <- gdispweight(mite ~ Shrub + WatrCont, data = mite.env)
rda(mite.dw ~ Shrub + WatrCont, data = mite.env)



