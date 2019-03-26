library(bio3d)


### Name: filter.rmsd
### Title: RMSD Filter
### Aliases: filter.rmsd
### Keywords: utilities

### ** Examples

## Not run: 
##D attach(kinesin)
##D 
##D k <- filter.rmsd(xyz=pdbs,cutoff=0.5)
##D pdbs$id[k$ind]
##D hclustplot(k$tree, h=0.5, ylab="RMSD")
##D abline(h=0.5, col="gray")
##D 
##D detach(kinesin)
## End(Not run)



