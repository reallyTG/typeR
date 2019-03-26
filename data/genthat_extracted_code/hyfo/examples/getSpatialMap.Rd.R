library(hyfo)


### Name: getSpatialMap
### Title: Get spatial map of the input dataset.
### Aliases: getSpatialMap

### ** Examples



## Not run: 
##D #gridData provided in the package is the result of \code {loadNcdf}
##D data(tgridData)
##D getSpatialMap(tgridData, method = 'meanAnnual')
##D getSpatialMap(tgridData, method = 'winter')
##D 
##D 
##D getSpatialMap(tgridData, method = 'winter', catchment = testCat)
##D 
##D file <- system.file("extdata", "point.txt", package = "hyfo")
##D point <- read.table(file, header = TRUE, sep = ',' )
##D getSpatialMap(tgridData, method = 'winter', catchment = testCat, point = point)
## End(Not run)


# More examples can be found in the user manual on http://yuanchao-xu.github.io/hyfo/




