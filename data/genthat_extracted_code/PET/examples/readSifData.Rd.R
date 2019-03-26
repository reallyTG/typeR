library(PET)


### Name: readSifData
### Title: Reloaded System Matrix
### Aliases: readSifData
### Keywords: IO file

### ** Examples

## Not run: 
##D P <- phantom(n=101)
##D rP <- markPoisson(P, nSample=1800000)
##D irP <- iradonIT(rP$rData, 101, 101, KernelFileSave=1, 
##D               KernelFileName="SystemMatrix.sif")
##D rm(irP,P,rP)
##D 
##D # reading the sif-matrix:
##D SysMat <- readSifData("SystemMatrix.sif")
##D names(SysMat)
##D SysMat$Header
##D rm(SysMat)
## End(Not run)




