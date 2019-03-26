library(bio3d)


### Name: filter.cmap
### Title: Contact Map Consensus Filtering
### Aliases: filter.cmap
### Keywords: analysis

### ** Examples


## Not run: 
##D    ## load example data
##D   pdbfile <- system.file("examples/hivp.pdb", package="bio3d")
##D   pdb <- read.pdb(pdbfile)
##D 
##D   trtfile <- system.file("examples/hivp.dcd", package="bio3d")
##D   trj <- read.dcd(trtfile, verbose=FALSE)
##D 
##D   ## split the trj example in two
##D   num.of.frames <- dim(trj)[1]
##D   trj1 <- trj[1:(num.of.frames/2),]
##D   trj2 <- trj[((num.of.frames/2)+1):num.of.frames,]
##D 
##D   ## Lets work with Calpha atoms only
##D   ca.inds <- atom.select(pdb, "calpha")
##D   #noh.inds <- atom.select(pdb, "noh")
##D 
##D   ## calculate single contact map matrices
##D   cms <- list()
##D   cms[[1]] <- cmap(trj1[,ca.inds$xyz], pcut=0.3, scut=0, dcut=7, mask.lower=FALSE)
##D   cms[[2]] <- cmap(trj1[,ca.inds$xyz], pcut=0.3, scut=0, dcut=7, mask.lower=FALSE)
##D 
##D   ## calculate average contact matrix
##D   cm.filter <- filter.cmap(cms, cutoff.sims=2)
##D 
##D   ## plot the result
##D   par(pty="s", mfcol=c(1,3))
##D   plot.cmap(cms[[1]])
##D   plot.cmap(cms[[2]])
##D   plot.cmap(cm.filter)
## End(Not run)



