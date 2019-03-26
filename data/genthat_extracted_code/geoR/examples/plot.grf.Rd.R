library(geoR)


### Name: plot.grf
### Title: Plots Variograms for Simulated Data
### Aliases: plot.grf
### Keywords: spatial dplot

### ** Examples

op <- par(no.readonly = TRUE)
par(mfrow=c(2,1))
sim1 <- grf(100, cov.pars=c(10, .25))
# generates simulated data
plot(sim1, plot.locations = TRUE)
#
# plots the locations and the sample true variogram model
#
par(mfrow=c(1,1))
sim2 <- grf(100, cov.pars=c(10, .25), nsim=10)
# generates 10 simulated data
plot(sim1)
# plots sample variograms for all simulations with the true model
par(op)



