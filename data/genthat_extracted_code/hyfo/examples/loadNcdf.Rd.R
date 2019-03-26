library(hyfo)


### Name: loadNcdf
### Title: Load NetCDF file
### Aliases: loadNcdf

### ** Examples

# First open the test NETcDF file.
filePath <- system.file("extdata", "tnc.nc", package = "hyfo")

# Then if you don't know the variable name, you can use \code{getNcdfVar} to get variable name
varname <- getNcdfVar(filePath)

nc <- loadNcdf(filePath, varname)

# you can directly add your downscale information to the argument.
nc1 <- loadNcdf(filePath, varname, year = 2006, lon = c(-2, -0.5), lat = c(43.2, 43.7))
nc2 <- loadNcdf(filePath, varname, year = 2005, month = 3:8, lon = c(-2, -0.5), 
lat = c(43.2, 43.7))

# More examples can be found in the user manual on http://yuanchao-xu.github.io/hyfo/




