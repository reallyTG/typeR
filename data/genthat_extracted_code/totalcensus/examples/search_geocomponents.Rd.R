library(totalcensus)


### Name: search_geocomponents
### Title: Search Geographic Components
### Aliases: search_geocomponents

### ** Examples

# Change view = TRUE (default) to View the returned data.
aaa <- search_geocomponents("decennial", 2010, "urban", view = FALSE)
bbb <- search_geocomponents("acs5", 2011:2015, "43", view = FALSE)

## Not run: 
##D   # view all geocomponents
##D   search_geocomponents("dec")
##D   search_geocomponents("acs")
## End(Not run)




