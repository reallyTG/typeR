library(adegenet)


### Name: haploGen
### Title: Simulation of genealogies of haplotypes
### Aliases: haploGen print.haploGen [.haploGen labels.haploGen
###   as.POSIXct.haploGen seqTrack.haploGen haploGen-class
###   as.seqTrack.haploGen as.igraph.haploGen plot.haploGen plotHaploGen
###   sample.haploGen

### ** Examples

## Not run: 
##D if(require(ape) && require(igraph)){
##D ## PERFORM SIMULATIONS
##D x <- haploGen(geo.sim=TRUE)
##D x
##D 
##D ## PLOT DATA
##D plot(x)
##D 
##D ## PLOT SPATIAL SPREAD
##D plotHaploGen(x, bg="white")
##D title("Spatial dispersion")
##D 
##D 
##D ## USE SEQTRACK RECONSTRUCTION
##D x.recons <- seqTrack(x)
##D mean(x.recons$ances==x$ances, na.rm=TRUE) # proportion of correct reconstructions
##D 
##D g <- as.igraph(x)
##D g
##D plot(g)
##D plot(g, vertex.size=0)
##D 
##D 
##D }
## End(Not run)



