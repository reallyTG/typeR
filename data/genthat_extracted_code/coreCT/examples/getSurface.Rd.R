library(coreCT)


### Name: getSurface
### Title: Remove artificial surface layers from processed CT data
### Aliases: getSurface

### ** Examples

### Not run:
## Not run: 
##D data(core_426)
##D ct.slope <- unique(extractHeader(core_426$hdr, "RescaleSlope"))
##D ct.int   <- unique(extractHeader(core_426$hdr, "RescaleIntercept")) 
##D # convert raw units to Hounsfield units
##D HU_426 <- lapply(core_426$img, function(x) x*ct.slope + ct.int)
##D 
##D materials <- conv(HU_426)
##D head(materials[, 1:6], 20)
##D 
##D materials2 <- getSurface(materials)
##D head(materials2[, 1:6])
## End(Not run)



