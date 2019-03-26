library(ade4)


### Name: carniherbi49
### Title: Taxonomy, phylogenies and quantitative traits of carnivora and
###   herbivora
### Aliases: carniherbi49
### Keywords: datasets

### ** Examples

## Not run: 
##D data(carniherbi49)
##D par(mfrow=c(1,3))
##D plot(newick2phylog(carniherbi49$tre1), clabel.leaves = 0,
##D  f.phylog = 2, sub ="article 1")
##D plot(newick2phylog(carniherbi49$tre2), clabel.leaves = 0,
##D  f.phylog = 2, sub = "article 2")
##D taxo <- as.taxo(carniherbi49$taxo)
##D plot(taxo2phylog(taxo), clabel.nodes = 1.2, clabel.leaves = 1.2)
##D par(mfrow = c(1,1))
## End(Not run)


