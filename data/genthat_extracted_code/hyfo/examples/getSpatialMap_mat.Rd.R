library(hyfo)


### Name: getSpatialMap_mat
### Title: Replot raster matrix
### Aliases: getSpatialMap_mat

### ** Examples


## Not run: 
##D data(tgridData)# the result of \code{loadNcdf}
##D #the output type of has to be default or 'data'.
##D a1 <- getSpatialMap(tgridData, method = 'mean')
##D a2 <- getSpatialMap(tgridData, method = 'max')
##D a3 <- getSpatialMap(tgridData, method = 'winter')
##D a4 <- getSpatialMap(tgridData, method = 'summer')
##D #For example, if we want to investigate the difference between mean value and max.
##D 
##D a5 <- a2 - a1
##D getSpatialMap_mat(a4)
##D 
##D #Or to investigate the difference between winter value and summer value.
##D a6 <- a3 - a4
##D getSpatialMap_mat(a6)
##D 
## End(Not run)


# More examples can be found in the user manual on https://yuanchao-xu.github.io/hyfo/




