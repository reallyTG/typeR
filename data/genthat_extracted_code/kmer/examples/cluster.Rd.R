library(kmer)


### Name: cluster
### Title: Divisive k-means clustering.
### Aliases: cluster

### ** Examples

## Not run: 
##D ## Cluster the woodmouse dataset (ape package)
##D library(ape)
##D data(woodmouse)
##D ## trim gappy ends to subset global alignment
##D woodmouse <- woodmouse[, apply(woodmouse, 2, function(v) !any(v == 0xf0))]
##D ## build tree divisively
##D set.seed(999)
##D woodmouse.tree <- cluster(woodmouse, nstart = 5)
##D ## plot tree
##D op <- par(no.readonly = TRUE)
##D par(mar = c(5, 2, 4, 8) + 0.1)
##D plot(woodmouse.tree, main = "Woodmouse phylogeny", horiz = TRUE)
##D par(op)
## End(Not run)



