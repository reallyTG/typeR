library(geoR)


### Name: plot.variogram
### Title: Plot Empirical Variogram
### Aliases: plot.variogram
### Keywords: spatial dplot

### ** Examples

op <- par(no.readonly = TRUE)
sim <- grf(100, cov.pars=c(1, .2)) # simulates data
vario <- variog(sim, max.dist=1)   # computes sample variogram
par(mfrow=c(2,2))
plot(vario)                     # the sample variogram
plot(vario, scaled = TRUE)      # the scaled sample variogram
plot(vario, max.dist = 1)       # limiting the maximum distance
plot(vario, pts.range = c(1,3)) # points sizes proportional to number of pairs
par(op)



