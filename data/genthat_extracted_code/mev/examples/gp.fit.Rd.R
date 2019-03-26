library(mev)


### Name: gp.fit
### Title: Peaks-over-threshold modelling using the generalized Pareto
###   distribution
### Aliases: gp.fit

### ** Examples

library(ismev)
data(rain)
threshold <- quantile(rain,0.9)
gp.fit(rain, threshold, method="Grimshaw")
gp.fit(rain, threshold, method="zs")



