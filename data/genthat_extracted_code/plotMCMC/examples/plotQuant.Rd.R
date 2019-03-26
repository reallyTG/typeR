library(plotMCMC)


### Name: plotQuant
### Title: Plot MCMC Quantiles
### Aliases: plotQuant
### Keywords: hplot ts

### ** Examples

plotQuant(xrec, names=substring(names(xrec),3), div=1000, xlab="Year",
          ylab="Recruitment (million one-year-olds)")
plotQuant(xbio, div=1000, xlab="Year", ylab="Biomass age 4+ (kt)")
plotQuant(xbio, style="bars", div=1000, sfrac=0, xlab="Year",
          ylab="Biomass age 4+ (kt)")
plotQuant(xbio, style="lines", div=1000, xlab="Year",
          ylab="Biomass age 4+ (kt)")
plotQuant(xpro, axes=1:2, div=1000, xlab="Year",
          ylab="Biomass age 4+ (kt)")



