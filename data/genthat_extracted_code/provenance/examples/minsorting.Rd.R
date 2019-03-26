library(provenance)


### Name: minsorting
### Title: Assess settling equivalence of detrital components
### Aliases: minsorting

### ** Examples

data(endmembers,densities)
distribution <- minsorting(endmembers,densities,sname='ophiolite',phi=2,
                           sigmaphi=1,medium="seawater",by=0.05)
plot(distribution,cumulative=FALSE)



