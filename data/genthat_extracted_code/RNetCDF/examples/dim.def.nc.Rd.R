library(RNetCDF)


### Name: dim.def.nc
### Title: Define a NetCDF Dimension
### Aliases: dim.def.nc
### Keywords: file

### ** Examples

##  Create a new NetCDF dataset and define two dimensions
nc <- create.nc("dim.def.nc")

dim.def.nc(nc, "station", 5)
dim.def.nc(nc, "time", unlim=TRUE)

close.nc(nc)



