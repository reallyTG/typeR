library(hyfo)


### Name: getFrcEnsem
### Title: Extract time series from forecasting data.
### Aliases: getFrcEnsem

### ** Examples


filePath <- system.file("extdata", "tnc.nc", package = "hyfo")
# Then if you don't know the variable name, you can use \code{getNcdfVar} to get variable name
varname <- getNcdfVar(filePath)
nc <- loadNcdf(filePath, varname)
a <- getFrcEnsem(nc)

# If there is no member session in the dataset, a single time sereis will be extracted.
a1 <- getFrcEnsem(tgridData)


# The default output is spatially averaged, if there are more than one cells in the dataset, 
# the mean value of the cells will be calculated. While if you are interested in special cell, 
# you can assign the cell value. You can also directly use longitude and latitude to extract 
# time series.

getSpatialMap(nc, 'mean')
a <- getFrcEnsem(nc, cell = c(6,2))

# From the map, cell = c(6, 2) means lon = -1.4, lat = 43.2, so you can use corrd to locate
# your research area and extract time series.
b <- getFrcEnsem(nc, coord = c(-1.4, 43.2))


# More examples can be found in the user manual on https://yuanchao-xu.github.io/hyfo/




