library(hyfo)


### Name: downscaleNcdf
### Title: Downscale NetCDF file
### Aliases: downscaleNcdf

### ** Examples

# First open the test NETcDF file.
filePath <- system.file("extdata", "tnc.nc", package = "hyfo")


# Then if you don't know the variable name, you can use \code{getNcdfVar} to get variable name
varname <- getNcdfVar(filePath)

nc <- loadNcdf(filePath, varname)

# Then write to your work directory

nc1 <- downscaleNcdf(nc, year = 2006, lon = c(-2, -0.5), lat = c(43.2, 43.7))
nc2 <- downscaleNcdf(nc, year = 2005, month = 3:8, lon = c(-2, -0.5), lat = c(43.2, 43.7))

# More examples can be found in the user manual on https://yuanchao-xu.github.io/hyfo/




