library(mregions)


### Name: mr_records_by_type
### Title: Get Marineregions records by place type
### Aliases: mr_records_by_type

### ** Examples

## Not run: 
##D # Get records of type 'EEZ', then inspect data.frame
##D res <- mr_records_by_type(type="EEZ")
##D head(res)
##D 
##D # You can use mr_place_types() function to get types
##D ## then pass those into this function
##D types <- mr_place_types()
##D mr_records_by_type(types$type[1])
##D mr_records_by_type(types$type[10])
##D 
##D # use regex to find a type name matching a pattern
##D x <- grep("MEOW", types$type, value = TRUE)
##D 
##D # then pass to the function
##D mr_records_by_type(x)
##D mr_records_by_type(x, offset = 100)
## End(Not run)



