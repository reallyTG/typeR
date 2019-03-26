library(RNetCDF)


### Name: att.get.nc
### Title: Get a NetCDF Attribute
### Aliases: att.get.nc
### Keywords: file

### ** Examples

##  Create a new NetCDF dataset and define two dimensions
nc <- create.nc("att.get.nc")

dim.def.nc(nc, "station", 5)
dim.def.nc(nc, "time", unlim=TRUE)

##  Create two variables, one as coordinate variable
var.def.nc(nc, "time", "NC_INT", "time")
var.def.nc(nc, "temperature", "NC_DOUBLE", c(0,1))

##  Put some attributes
att.put.nc(nc, "temperature", "missing_value", "NC_DOUBLE", -99999.9)
att.put.nc(nc, "temperature", "long_name", "NC_CHAR", "air temperature")
att.put.nc(nc, "NC_GLOBAL", "title", "NC_CHAR", "Data from Foo")
att.put.nc(nc, "NC_GLOBAL", "history", "NC_CHAR", paste("Created on", date()))

##  Get these attributes
att.get.nc(nc, "temperature", "missing_value")
att.get.nc(nc, "temperature", "long_name")
att.get.nc(nc, "NC_GLOBAL", "title")
att.get.nc(nc, "NC_GLOBAL", "history")

close.nc(nc)



