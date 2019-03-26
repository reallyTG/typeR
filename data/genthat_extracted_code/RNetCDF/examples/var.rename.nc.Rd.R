library(RNetCDF)


### Name: var.rename.nc
### Title: Rename a NetCDF Variable
### Aliases: var.rename.nc
### Keywords: file

### ** Examples

##  Create a new NetCDF dataset and define two dimensions
nc <- create.nc("var.rename.nc")

dim.def.nc(nc, "station", 5)
dim.def.nc(nc, "time", unlim=TRUE)

##  Create two variables, one as coordinate variable
var.def.nc(nc, "time", "NC_INT", "time")
var.def.nc(nc, "temperature", "NC_DOUBLE", c(0,1))

##  Rename these variables
var.rename.nc(nc, 0, "mytime")
var.rename.nc(nc, "temperature", "mytemperature")

close.nc(nc)



