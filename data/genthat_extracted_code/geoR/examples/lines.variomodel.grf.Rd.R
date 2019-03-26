library(geoR)


### Name: lines.variomodel.grf
### Title: Lines with True Variogram for Simulated Data
### Aliases: lines.variomodel.grf
### Keywords: spatial aplot

### ** Examples

sim <- grf(100, cov.pars=c(1, .25)) # simulates data
plot(variog(sim, max.dist=1))       # plot empirical variogram



