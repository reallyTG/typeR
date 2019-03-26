library(hyfo)


### Name: getNcdfVar
### Title: Get variable name of the NetCDF file.
### Aliases: getNcdfVar

### ** Examples

# First open the test NETcDF file.
filePath <- system.file("extdata", "tnc.nc", package = "hyfo")

# Then if you don't know the variable name, you can use \code{getNcdfVar} to get variable name
varname <- getNcdfVar(filePath)

# More examples can be found in the user manual on https://yuanchao-xu.github.io/hyfo/




