library(sdmpredictors)


### Name: pearson_correlation_matrix
### Title: Calculate the Pearson correlation coefficient matrix for a
###   rasterstack
### Aliases: pearson_correlation_matrix

### ** Examples

## Not run: 
##D # calculate correlation between SST and salinity in the Baltic Sea
##D 
##D # warning using tempdir() implies that data will be downloaded again in the
##D # next R session
##D x <- load_layers(c("BO_sstmax", "BO_salinity"), datadir = tempdir())
##D e <- extent(13, 31, 52, 66)
##D baltics <- crop(x, e)
##D print(pearson_correlation_matrix(baltics))
## End(Not run)



