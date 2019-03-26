library(phangorn)


### Name: consensusNet
### Title: Computes a consensusNetwork from a list of trees Computes a
###   'networx' object from a collection of splits.
### Aliases: consensusNet
### Keywords: hplot

### ** Examples


data(Laurasiatherian)
set.seed(1)
bs <- bootstrap.phyDat(Laurasiatherian, FUN = function(x)nj(dist.hamming(x)), 
    bs=50)
cnet <- consensusNet(bs, .3)
plot(cnet, "2D")
## Not run: 
##D library(rgl)
##D open3d()
##D plot(cnet, show.tip.label=FALSE, show.nodes=TRUE)
##D plot(cnet, type = "2D", show.edge.label=TRUE)
##D 
##D tmpfile <- normalizePath(system.file("extdata/trees/RAxML_bootstrap.woodmouse", package="phangorn"))
##D trees <- read.tree(tmpfile)
##D cnet_woodmouse <- consensusNet(trees, .3)
##D plot(cnet_woodmouse, type = "2D", show.edge.label=TRUE)
## End(Not run)




