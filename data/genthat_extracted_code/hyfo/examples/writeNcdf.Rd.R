library(hyfo)


### Name: writeNcdf
### Title: Write to NetCDF file using hyfo list file
### Aliases: writeNcdf

### ** Examples

# First open the test NETcDF file.
filePath <- system.file("extdata", "tnc.nc", package = "hyfo")


# Then if you don't know the variable name, you can use \code{getNcdfVar} to get variable name
varname <- getNcdfVar(filePath)

nc <- loadNcdf(filePath, varname)

# Then write to your work directory

writeNcdf(nc, 'test.nc')

# More examples can be found in the user manual on https://yuanchao-xu.github.io/hyfo/




