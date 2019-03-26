library(indicspecies)


### Name: plotniche
### Title: Draws a single resource niche
### Aliases: plotniche

### ** Examples

# Loads example data
data(birds)

plotniche(birdsbreed, D = resourceD, mode="multiple", species=10) 
plotniche(birdsbreed, D = resourceD, mode="multiple", 
Np = rowSums(birdsbreed), Nq = 100, species=10) 
plotniche(birdsbreed, D = resourceD, 
q = c(0.18, 0.24, 0.22, 0.21, 0.15), mode="multiple", species=10)
plotniche(birdsbreed, D = resourceD, 
q = c(0.18, 0.24, 0.22, 0.21, 0.15), mode="multiple", 
Np = rowSums(birdsbreed), Nq = 100, species=10)

#draw two species
plotniche(birdsbreed, D = resourceD, mode="multiple", 
Np = rowSums(birdsbreed), Nq = 100, species=10, writeName=TRUE, 
bubbles=FALSE, chull=FALSE) 
plotniche(birdsbreed, D = resourceD,  mode="multiple", 
Np = rowSums(birdsbreed), Nq = 100, species=1, writeName=TRUE, 
bubbles=FALSE, chull=FALSE, add=TRUE, col="red", lty=2) 




