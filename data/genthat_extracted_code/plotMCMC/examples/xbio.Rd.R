library(plotMCMC)


### Name: xbio
### Title: MCMC Results for Biomass
### Aliases: xbio
### Keywords: datasets

### ** Examples

plotDens(xbio$"2004", points=TRUE, div=1000, main="2004\n",
         xlab="Biomass age 4+ (1000 t)", tick.number=6, strip=FALSE)

plotQuant(xbio, div=1000, xlab="Year", ylab="Biomass age 4+ (kt)")
plotQuant(xbio, style="bars", div=1000, sfrac=0, xlab="Year",
          ylab="Biomass age 4+ (kt)")
plotQuant(xbio, style="lines", div=1000, xlab="Year",
          ylab="Biomass age 4+ (kt)")



