library(provenance)


### Name: plot.minsorting
### Title: Plot inferred grain size distributions
### Aliases: plot.minsorting

### ** Examples

data(endmembers,densities)
OPH <- subset(endmembers,select="ophiolite")
distribution <- minsorting(OPH,densities,phi=2,sigmaphi=1,
                           medium="air",by=0.05)
plot(distribution,components=c('F','px','opaques'))



