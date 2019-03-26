library(bdpv)


### Name: plotnPV2
### Title: Plot experimental design for different settings in a set of sub
###   figure.
### Aliases: plotnPV2
### Keywords: hplot

### ** Examples


TEST<-nPV(se=c(0.9, 0.92, 0.94, 0.96, 0.98), sp=c(0.98, 0.96, 0.94, 0.92, 0.90),
 pr=0.12, NPV0=0.98, PPV0=0.4, NPVpower = 0.8, PPVpower = 0.8,
 rangeP = c(0.05, 0.95), nsteps = 20, alpha = 0.05)

plotnPV2(TEST, log="x")



