library(bio3d)


### Name: read.crd.charmm
### Title: Read CRD File
### Aliases: read.crd.charmm
### Keywords: IO

### ** Examples

## Not run: 
##D  pdb <- read.pdb("1bg2")
##D  crdfile <- paste(tempfile(), '.crd', sep='')
##D  write.crd(pdb, file=crdfile)
##D  crd <- read.crd(crdfile, ext=FALSE)
##D  ca.inds <- which(crd$calpha)
##D  crd$atom[ca.inds[1:20],c("x","y","z")]
##D # write.pdb(crd, file=tempfile())
## End(Not run)



