library(rare)


### Name: find.leaves
### Title: Find all descendant leaves of a node in an hclust tree
### Aliases: find.leaves

### ** Examples

## Not run: 
##D hc <- hclust(dist(USArrests), "ave")
##D # Descendant leaves of the 10th leaf (should be iteself)
##D find.leaves(-10, hc$merge)
##D 
##D # Descendant leaves of the 10th interior node
##D find.leaves(10, hc$merge)
##D 
##D # Descendant leaves of the root (should be all leaves)
##D ind_root <- nrow(hc$merge)
##D all.equal(find.leaves(ind_root, hc$merge), hc$order)
## End(Not run)




