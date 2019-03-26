library(RNetCDF)


### Name: dim.inq.nc
### Title: Inquire About a NetCDF Dimension
### Aliases: dim.inq.nc
### Keywords: file

### ** Examples

##  Create a new NetCDF dataset and define two dimensions
nc <- create.nc("dim.inq.nc")

dim.def.nc(nc, "station", 5)
dim.def.nc(nc, "time", unlim=TRUE)

##  Inquire about the dimensions
dim.inq.nc(nc, 0)
dim.inq.nc(nc, "time")

close.nc(nc)



