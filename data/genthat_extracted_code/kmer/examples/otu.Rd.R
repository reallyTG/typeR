library(kmer)


### Name: otu
### Title: Cluster sequences into operational taxonomic units.
### Aliases: otu

### ** Examples

## Not run: 
##D ## Cluster the woodmouse dataset (from the ape package) into OTUs
##D library(ape)
##D data(woodmouse)
##D ## trim gappy ends to subset global alignment
##D woodmouse <- woodmouse[, apply(woodmouse, 2, function(v) !any(v == 0xf0))]
##D ## cluster sequences into OTUs at 0.97 threshold with kmer size = 5
##D set.seed(999)
##D woodmouse.OTUs <- otu(woodmouse, k = 5, threshold = 0.97, nstart = 20)
##D woodmouse.OTUs
## End(Not run)



