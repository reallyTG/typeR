library(metR)


### Name: ReadNetCDF
### Title: Read NetCDF files.
### Aliases: ReadNetCDF

### ** Examples

## Not run: 
##D file <- "file.nc"
##D # Get a list of variables.
##D variables <- ReadNetCDF(file, out = "vars")
##D # Read only the first one, with name "var".
##D field <- ReadNetCDF(file, vars = c(var = variables$vars[1]))
##D # Add a new variable.
##D # ¡Make sure it's on the same exact grid!
##D field[, var2 := ReadNerCDF(file2, out = "vector", subset = list(lat = 90:10))]
## End(Not run)




