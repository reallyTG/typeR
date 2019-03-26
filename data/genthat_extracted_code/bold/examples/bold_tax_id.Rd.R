library(bold)


### Name: bold_tax_id
### Title: Search BOLD for taxonomy data by BOLD ID.
### Aliases: bold_tax_id

### ** Examples

## Not run: 
##D bold_tax_id(id=88899)
##D bold_tax_id(id=88899, includeTree=TRUE)
##D bold_tax_id(id=88899, includeTree=TRUE, dataTypes = "stats")
##D bold_tax_id(id=c(88899,125295))
##D 
##D ## dataTypes parameter
##D bold_tax_id(id=88899, dataTypes = "basic")
##D bold_tax_id(id=88899, dataTypes = "stats")
##D bold_tax_id(id=88899, dataTypes = "images")
##D bold_tax_id(id=88899, dataTypes = "geo")
##D bold_tax_id(id=88899, dataTypes = "sequencinglabs")
##D bold_tax_id(id=88899, dataTypes = "depository")
##D bold_tax_id(id=c(88899,125295), dataTypes = "geo")
##D bold_tax_id(id=c(88899,125295), dataTypes = "images")
##D 
##D ## Passing in NA
##D bold_tax_id(id = NA)
##D bold_tax_id(id = c(88899,125295,NA))
##D 
##D ## get http response object only
##D bold_tax_id(id=88899, response=TRUE)
##D bold_tax_id(id=c(88899,125295), response=TRUE)
##D 
##D ## curl debugging
##D bold_tax_id(id=88899, verbose = TRUE)
## End(Not run)



