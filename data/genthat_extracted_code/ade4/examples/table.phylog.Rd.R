library(ade4)


### Name: table.phylog
### Title: Plot arrays in front of a phylogenetic tree
### Aliases: table.phylog
### Keywords: hplot

### ** Examples

## Not run: 
##D data(newick.eg)
##D w.phy <- newick2phylog(newick.eg[[9]])
##D w.tab <- data.frame(matrix(rnorm(620), 31, 20))
##D row.names(w.tab) <- sort(names(w.phy$leaves))
##D table.phylog(w.tab, w.phy, csi = 1.5, f = 0.5,
##D  clabel.n = 0.75, clabel.c = 0.5)
## End(Not run)



