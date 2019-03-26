library(oceanmap)


### Name: nc2time
### Title: reads and converts the time variable of a netcdf-file
###   ('.nc'-file) or 'ncdf4'-object as 'as.Date'-object
### Aliases: nc2time

### ** Examples

path <- system.file("test_files", package="oceanmap")
nfile <- Sys.glob(paste0(path,'/herring*.nc')) # load sample-'.nc'-files
head(nc2time(nfile))

library('ncdf4')
nc <- nc_open(nfile)
head(nc2time(nc))




