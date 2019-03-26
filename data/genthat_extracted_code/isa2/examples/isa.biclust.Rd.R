library(isa2)


### Name: isa.biclust
### Title: Convert ISA modules to a Biclust class, as defined by the
###   biclust package
### Aliases: isa.biclust

### ** Examples

## You need the biclust package for this
## Not run: 
##D if (require(biclust)) {
##D   set.seed(1)
##D   data <- isa.in.silico()
##D   modules <- isa(data[[1]])
##D   bc <- isa.biclust(modules)
##D 
##D   ## A heatmap
##D   drawHeatmap(data[[1]], bc, 1)
##D 
##D   ## A "bubble" plot
##D   bubbleplot(data[[1]], bc)
##D 
##D   ## Compare values inside and outside the bicluster
##D   plotclust(bc, data[[1]])
##D 
##D   ## Plot profiles of bicluster elements
##D   parallelCoordinates(data[[1]], bc, number=1)
##D 
##D   ## Coherence measures vs. ISA robustness
##D   cV <- sapply(seq(bc@Number), function(x)
##D      constantVariance(data[[1]], bc, x, dimension="both"))
##D   aV <- sapply(seq(bc@Number), function(x)
##D      additiveVariance(data[[1]], bc, x, dimension="both"))
##D   mV <- sapply(seq(bc@Number), function(x)
##D      multiplicativeVariance(data[[1]], bc, x, dimension="both"))
##D   sV <- sapply(seq(bc@Number), function(x)
##D      signVariance(data[[1]], bc, x, dimension="both"))
##D 
##D   rob <- robustness(isa.normalize(data[[1]]), modules$rows,
##D      modules$columns)
##D 
##D   cor( cbind(cV, aV, mV, sV, rob) )
##D }
## End(Not run)



