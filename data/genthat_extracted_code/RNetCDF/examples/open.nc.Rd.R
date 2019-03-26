library(RNetCDF)


### Name: open.nc
### Title: Open a NetCDF Dataset
### Aliases: open.nc
### Keywords: file

### ** Examples

##  Create a void NetCDF dataset
nc <- create.nc("open.nc")
close.nc(nc)

##  Open the NetCDF dataset for writing
nc <- open.nc("open.nc", write=TRUE)
close.nc(nc)



