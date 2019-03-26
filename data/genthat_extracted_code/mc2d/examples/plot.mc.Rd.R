library(mc2d)


### Name: plot.mc
### Title: Plots Results of a Monte Carlo Simulation
### Aliases: plot.mc plot.mcnode plot.plotmc plot.mccut
### Keywords: hplot

### ** Examples

data(total)

plot(xVUM3)
## only one enveloppe corresponding to quantiles 0.025 and 0.975
plot(xVUM3, lim=c(0.025, 0.975)) 
## only one enveloppe not painted
plot(xVUM3, lim=c(0.025, 0.975), paint=FALSE) 

def.par <- par(no.readonly = TRUE)
par(mar=c(4, 4, 1, 1))
plot(total)
par(def.par)






