library(bio3d)


### Name: read.ncdf
### Title: Read AMBER Binary netCDF files
### Aliases: read.ncdf
### Keywords: IO

### ** Examples

## Not run: 
##D ##-- Read example trajectory file
##D trtfile <- system.file("examples/hivp.dcd", package="bio3d")
##D trj <- read.dcd(trtfile)
##D 
##D ## Write to netCDF format
##D write.ncdf(trj, "newtrj.nc")
##D 
##D ## Read trj
##D trj <- read.ncdf("newtrj.nc")
## End(Not run)



