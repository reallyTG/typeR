library(R2MLwiN)


### Name: Untoggle
### Title: Converts a categorical variable into several separate binary
###   variables
### Aliases: Untoggle

### ** Examples


## Not run: 
##D library(R2MLwiN)
##D # NOTE: Assumes MLwiN path is C:/Program Files (x86)/MLwiN v2.30/
##D # ...so please change relevant line if different
##D # if using R2MLwiN via WINE, the path may look like 
##D # options(MLwiN_path='/home/USERNAME/.wine/drive_c/Program Files (x86)/MLwiN v2.30/') 
##D 
##D # Example: tutorial
##D data(tutorial)
##D names(tutorial)
##D tutorial = cbind(tutorial, Untoggle(tutorial$school, 'school'))
##D names(tutorial)
## End(Not run)




