library(sharpshootR)


### Name: plotTransect
### Title: Plot a collection of Soil Profiles linked to their position
###   along some gradient (e.g. transect).
### Aliases: plotTransect
### Keywords: hplots

### ** Examples

## Not run: 
##D data(loafercreek, package='soilDB')
##D 
##D x <- loafercreek[1:10, ]
##D coordinates(x) <- ~ x_std + y_std
##D proj4string(x) <- '+proj=longlat +datum=NAD83'
##D 
##D par(mar=c(4,3,1,1))
##D plotTransect(x, 'elev_field', crs=CRS('+proj=utm +zone=10 +datum=NAD83'), max.depth=185)
## End(Not run)



