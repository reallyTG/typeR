library(Momocs)


### Name: CLUST
### Title: Hierarchical clustering
### Aliases: CLUST CLUST.default

### ** Examples

## Not run: 
##D 
##D # we prepare a PCA with shorter names
##D olea_lite <- olea
##D names(olea_lite) <- as.character(olea$fac$var)
##D x <- olea_lite %>% opoly(5) %>% PCA()
##D 
##D # By default
##D CLUST(x)
##D 
##D # With a fac
##D CLUST(x, 1)
##D 
##D # plot.phylo types
##D CLUST(x, "var", type="cladogram")
##D CLUST(x, "var", type="phylogram")
##D CLUST(x, "var", type="radial")
##D CLUST(x, "var", type="unrooted")
##D 
##D # other dist/hclust methods
##D CLUST(x, "var", layout="cladogram", dist_method="minkowski", hclust_method="average")
##D 
##D # With another
##D CLUST(x, "domes", tip_labels="var", palette=col_india)
##D 
##D # Alternative ways to pass a factor
##D CLUST(x, 1)
##D CLUST(x, "var")
##D CLUST(x, ~var)
##D # Strict equivalent before but formula allows this:
##D CLUST(x, ~ domes + var, tip_labels = ~ domes + var)
##D 
##D # More arguments to plot.phylo
##D CLUST(x, cex=0.5)
##D 
## End(Not run)



