library(totalcensus)


### Name: search_summarylevels
### Title: Search Summary Levels
### Aliases: search_summarylevels

### ** Examples

# Change view = TRUE (default) to View the returned data.
aaa = search_summarylevels("decennial", 2010, "block", view = FALSE)
bbb <- search_summarylevels("acs5", 2009:2010, "40", view = FALSE)

## Not run: 
##D   # view all summary levels
##D   search_summarylevels("decennial")
##D   search_summarylevels("acs1")
## End(Not run)




