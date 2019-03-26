library(RNHANES)


### Name: nhanes_load_data
### Title: Download NHANES data files.
### Aliases: nhanes_load_data

### ** Examples


## Not run: 
##D 
##D nhanes_load_data("UHG", "2011-2012")
##D 
##D # Load data with demographics
##D nhanes_load_data("UHG", "2011-2012", demographics = TRUE)
##D 
##D # Download to /tmp directory and overwrite the file if it already exists
##D nhanes_load_data("HDL_E", "2007-2008", destination = "/tmp", cache = FALSE)
## End(Not run)




