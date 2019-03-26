library(hsdar)


### Name: import_USGS
### Title: import USGS spectra
### Aliases: USGS_get_available_files USGS_retrieve_files
### Keywords: multivariate

### ** Examples

## Not run: 
##D ## Retrieve all available spectra
##D avl <- USGS_get_available_files()
##D 
##D ## Download all spectra matching "grass-fescue"
##D grass_spectra <- USGS_retrieve_files(avl = avl, pattern = "grass-fescue")
##D 
##D plot(grass_spectra)
## End(Not run)



