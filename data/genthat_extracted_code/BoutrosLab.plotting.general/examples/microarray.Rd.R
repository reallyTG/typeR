library(BoutrosLab.plotting.general)


### Name: microarray
### Title: Microarray dataset of colon cancer patients
### Aliases: microarray
### Keywords: datasets

### ** Examples

## Not run: 
##D create.dotmap(
##D     filename = paste0(tempdir(),'/Using_microarray_dataset.tiff'),
##D     x = microarray[1:5,1:5],
##D     main = 'microarray data',
##D     spot.size.function = function(x) {abs(x)/3;},
##D     xaxis.cex = 0.8,
##D         yaxis.cex = 0.8,
##D         xaxis.rot = 90,
##D     description = 'Dotmap created by BoutrosLab.plotting.general'
##D     );
## End(Not run)



