library(RNetCDF)


### Name: var.put.nc
### Title: Write Data to a NetCDF Variable
### Aliases: var.put.nc
### Keywords: file

### ** Examples

##  Create a new NetCDF dataset and define two dimensions
nc <- create.nc("var.put.nc")

dim.def.nc(nc, "station", 5)
dim.def.nc(nc, "time", unlim=TRUE)
dim.def.nc(nc, "max_string_length", 32)

##  Create three variables, one as coordinate variable
var.def.nc(nc, "time", "NC_INT", "time")
var.def.nc(nc, "temperature", "NC_DOUBLE", c(0,1))
var.def.nc(nc, "name", "NC_CHAR", c("max_string_length", "station"))

##  Put some missing_value attribute for temperature
att.put.nc(nc, "temperature", "missing_value", "NC_DOUBLE", -99999.9)

##  Define variable values
mytime        <- c(1:2)
mytemperature <- c(1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, NA, NA, 9.9)
myname        <- c("alfa", "bravo", "charlie", "delta", "echo")

dim(mytemperature) <- c(5,2)

##  Put subsets of the data:
var.put.nc(nc, "time", mytime, start=2, count=1)
var.put.nc(nc, "temperature", mytemperature[3:4,2], start=c(3,2), count=c(2,1))
var.put.nc(nc, "name", myname[3:4], start=c(NA,3), count=c(NA,2))
sync.nc(nc)

##  Put all of the data:
var.put.nc(nc, "time", mytime)
var.put.nc(nc, "temperature", mytemperature)
var.put.nc(nc, "name", myname)

close.nc(nc)



