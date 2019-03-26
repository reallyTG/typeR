library(OutbreakTools)


### Name: read annotated trees
### Title: Read annotated tree files in Newick or NEXUS format
### Aliases: read.annotated.tree read.annotated.nexus

### ** Examples

## Not run: 
##D ## read annotated tree from Nexus file
##D ## (note: do not use 'system file' for your own file!)
##D tre <- read.annotated.nexus(system.file("files/BEAST-expl.nex", package="OutbreakTools"))
##D 
##D ## ladderize the tree
##D tre <- ladderize(tre)
##D 
##D ## this tree has annotations
##D ##
##D names(tre)
##D class(tre$annotations)
##D length(tre$annotations)
##D 
##D ## for each edge (each edge is identified by a terminal node), we have:
##D tre$annotations[[1]]
##D names(tre$annotations[[1]])
##D 
##D ## extract rates from annotations
##D rates <- unlist(sapply(tre$annotations, function(e) e$rate_median))
##D 
##D ## plot tree, show median rates as colors
##D plot(tre, show.tip=FALSE, edge.col=num2col(rates, col.pal=seasun))
##D 
## End(Not run)



