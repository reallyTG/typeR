library(RNetCDF)


### Name: att.inq.nc
### Title: Inquire About a NetCDF Attribute
### Aliases: att.inq.nc
### Keywords: file

### ** Examples

##  Create a new NetCDF dataset and define two dimensions
nc <- create.nc("att.inq.nc")

dim.def.nc(nc, "station", 5)
dim.def.nc(nc, "time", unlim=TRUE)

##  Create two variables, one as coordinate variable
var.def.nc(nc, "time", "NC_INT", "time")
var.def.nc(nc, "temperature", "NC_DOUBLE", c(0,1))

##  Put some attributes
att.put.nc(nc, "temperature", "missing_value", "NC_DOUBLE", -99999.9)
att.put.nc(nc, "NC_GLOBAL", "title", "NC_CHAR", "Data from Foo")

##  Inquire about these attributes
att.inq.nc(nc, "temperature", "missing_value")
att.inq.nc(nc, "NC_GLOBAL", "title")

close.nc(nc)



