library(RNetCDF)


### Name: att.copy.nc
### Title: Copy Attribute from One NetCDF to Another
### Aliases: att.copy.nc
### Keywords: file

### ** Examples

##  Create two new NetCDF datasets and define two dimensions
nc.1 <- create.nc("att.copy1.nc")
nc.2 <- create.nc("att.copy2.nc")

dim.def.nc(nc.1, "station", 5)
dim.def.nc(nc.1, "time", unlim=TRUE)

dim.def.nc(nc.2, "station", 5)
dim.def.nc(nc.2, "time", unlim=TRUE)

##  Create two variables, one as coordinate variable
var.def.nc(nc.1, "time", "NC_INT", "time")
var.def.nc(nc.1, "temperature", "NC_DOUBLE", c(0,1))

var.def.nc(nc.2, "time", "NC_INT", "time")
var.def.nc(nc.2, "temperature", "NC_DOUBLE", c(0,1))

##  Put some attributes to the first dataset
att.put.nc(nc.1, "temperature", "missing_value", "NC_DOUBLE", -99999.9)
att.put.nc(nc.1, "NC_GLOBAL", "title", "NC_CHAR", "Data from Foo")

##  Copy the attributes to the second dataset
att.copy.nc(nc.1, 1, 0, nc.2, 1)
att.copy.nc(nc.1, "NC_GLOBAL", "title", nc.2, "NC_GLOBAL")

close.nc(nc.1)
close.nc(nc.2)



