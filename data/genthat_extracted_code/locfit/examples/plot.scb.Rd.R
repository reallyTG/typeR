library(locfit)


### Name: plot.scb
### Title: Plot method for simultaneous confidence bands
### Aliases: plot.scb plot.scb.1d plot.scb.2d
### Keywords: methods

### ** Examples

# corrected confidence bands for a linear logistic model
data(insect)
fit <- scb(deaths ~ lconc, type=4, w=nins, data=insect,
           deg=1, family="binomial", kern="parm")
plot(fit)



