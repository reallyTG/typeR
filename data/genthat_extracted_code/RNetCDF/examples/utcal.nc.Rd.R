library(RNetCDF)


### Name: utcal.nc
### Title: Convert Temporal Amounts to UTC Referenced Dates
### Aliases: utcal.nc
### Keywords: utilities

### ** Examples

##  Convert units to UTC referenced time
utcal.nc("hours since 1900-01-01 00:00:00 +01:00", c(0:5))
utcal.nc("hours since 1900-01-01 00:00:00 +01:00", c(0:5), type="s")
utcal.nc("hours since 1900-01-01 00:00:00 +01:00", c(0:5), type="c")

## Create netcdf file with a time coordinate variable.

# Create a time variable (using type POSIXct for convenience):
nt <- 24
time_posixct <- seq(ISOdatetime(1900,1,1,0,0,0,tz="UTC"), by="hour", len=nt)

# Convert time variable to specified units:
time_unit <- "hours since 1900-01-01 00:00:00 +00:00"
time_coord <- utinvcal.nc(time_unit, time_posixct)

# Create a netcdf file:
nc <- create.nc("utcal.nc")

# Global attributes:
att.put.nc(nc, "NC_GLOBAL", "Conventions", "NC_CHAR", "CF-1.6")
att.put.nc(nc, "NC_GLOBAL", "title", "NC_CHAR", "RNetCDF example: time coordinate")
att.put.nc(nc, "NC_GLOBAL", "institution", "NC_CHAR", "University of Areland")
att.put.nc(nc, "NC_GLOBAL", "source", "NC_CHAR", 
  paste("RNetCDF", installed.packages()["RNetCDF","Version"], sep="_"))
att.put.nc(nc, "NC_GLOBAL", "history", "NC_CHAR",
  paste(Sys.time(), "File created"))
att.put.nc(nc, "NC_GLOBAL", "references", "NC_CHAR",
  "http://www.unidata.ucar.edu/software/udunits")
att.put.nc(nc, "NC_GLOBAL", "comment", "NC_CHAR",
  "Uses attributes recommended by http://cfconventions.org")

# Define time coordinate and attributes:
dim.def.nc(nc, "time", nt)
var.def.nc(nc, "time", "NC_INT", "time")
att.put.nc(nc, "time", "long_name", "NC_CHAR", "time")
att.put.nc(nc, "time", "units", "NC_CHAR", time_unit)
# Calendar is optional (gregorian is the default):
att.put.nc(nc, "time", "calendar", "NC_CHAR", "gregorian")

# Write the data:
var.put.nc(nc, "time", time_coord)

close.nc(nc)

## Read time coordinate from netcdf file:

# Open the file prepared earlier:
nc <- open.nc("utcal.nc")

# Read time coordinate and attributes:
time_coord2 <- var.get.nc(nc, "time")
time_unit2 <- att.get.nc(nc, "time", "units")

close.nc(nc)

# Convert the time variable to POSIXct:
time_posixct2 <- utcal.nc(time_unit2, time_coord2, "c")

# Compare with original POSIXct variable:
stopifnot(all.equal(time_posixct, time_posixct2))



