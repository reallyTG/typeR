library(hgutils)


### Name: load_packages
### Title: Load and install packages
### Aliases: load_packages list_package_collections load_package_collection
###   list_common_packages load_common_packages

### ** Examples

## Not run: 
##D # Package names can be given as a vector or one-by-one
##D load_packages(c('magrittr','dplyr'))
##D load_packages('magrittr','dplyr',install_packages=FALSE)
##D 
##D # These are equivalent
##D load_common_packages()
##D load_packages(list_common_packages())
##D 
##D #load package collection "processing"
##D #installs/loads dplyr, lubridate, magrittr, mice, stringr, tibble and utils
##D load_package_collection("processing")
## End(Not run)



