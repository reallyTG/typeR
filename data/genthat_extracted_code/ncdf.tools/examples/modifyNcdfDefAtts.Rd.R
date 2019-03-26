library(ncdf.tools)


### Name: modifyNcdfDefAtts
### Title: Define a set netCDF attributes at once
### Aliases: modifyNcdfDefAtts

### ** Examples

## needs an open connection to a valid netCDF file pointed to by file.con
attributes.define <- list(LongName = 'This is the long name',
                          missingValue = -99999,
                          units = 'm/s')
library(RNetCDF)
file.con   <- create.nc('test.nc')
dim.def.nc(file.con, 'testdim')
var.def.nc(file.con, 'test', 'NC_CHAR', 'testdim')
modifyNcdfDefAtts(file.con, 'test', atts = attributes.define)

## show all attributes
infoNcdfAtts(file.con, 'test')



