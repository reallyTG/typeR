library(provenance)


### Name: endmembers
### Title: Petrographic end-member compositions
### Aliases: endmembers

### ** Examples

data(endmembers,densities)
ophiolite <- subset(endmembers,select="ophiolite")
plot(minsorting(ophiolite,densities,by=0.05))



