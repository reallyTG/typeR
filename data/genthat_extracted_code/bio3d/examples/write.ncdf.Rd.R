library(bio3d)


### Name: write.ncdf
### Title: Write AMBER Binary netCDF files
### Aliases: write.ncdf
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



