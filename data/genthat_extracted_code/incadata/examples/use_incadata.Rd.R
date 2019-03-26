library(incadata)


### Name: use_incadata
### Title: Use incadata from file or dataframe df
### Aliases: use_incadata

### ** Examples

## Not run: 
##D # Create a csv file with example data in a temporary directory
##D fl <- tempfile("ex_data", fileext = ".csv2")
##D write.csv2(incadata::ex_data, fl)
##D 
##D # First time the file is read from csv2
##D use_incadata(fl)
##D dir(tempdir) # a cache file is saved along the original csv2-file
##D use_incadata(fl) # Next time file loaded from cache
## End(Not run)



