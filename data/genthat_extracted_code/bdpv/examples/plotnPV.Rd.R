library(bdpv)


### Name: plotnPV
### Title: Plot experimental design for different setting in a single
###   figure.
### Aliases: plotnPV
### Keywords: hplot

### ** Examples



TEST<-nPV(se=c(0.9, 0.92, 0.94, 0.96, 0.98), sp=c(0.98, 0.96, 0.94, 0.92, 0.90),
 pr=0.12, NPV0=0.98, PPV0=0.4, NPVpower = 0.8, PPVpower = 0.8,
 rangeP = c(0.05, 0.95), nsteps = 100, alpha = 0.05)

plotnPV(TEST)

# plot parameters maybe introduced via ...
# the legend maybe modified via legpar:

plotnPV(TEST, log="y", legpar=list(x=0.6))

# own colour definitions
plotnPV(TEST, NPVpar=list(col=1:6, lwd=2, lty=1),
 PPVpar=list(col=1:6, lwd=2, lty=3))





