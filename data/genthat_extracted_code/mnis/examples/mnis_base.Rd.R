library(mnis)


### Name: mnis_base
### Title: A generic function for the MNIS API lookup. The function
###   requests data in JSON format, but the type of object, and all URLs,
###   paths and parameters are user-defined. 'mnis_base' does not include
###   the option to tidy variable names and data types, but the 'mnis_tidy'
###   function can be called on the data returned from the API.
### Aliases: mnis_base
### Keywords: mnis

### ** Examples

## Not run: 
##D 
##D x <- mnis_base('House=Commons|IsEligible=true/')
##D 
## End(Not run)



