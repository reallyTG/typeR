library(totalcensus)


### Name: search_tables
### Title: Search Tables
### Aliases: search_tables

### ** Examples

# Change view = TRUE (default) to View the returned data.
aaa <- search_tables("dec", 2010, "occupancy", view = FALSE)
bbb <- search_tables("acs5", 2014:2016, "detailed race", view = FALSE)

## Not run: 
##D   # view all tables
##D   search_tables("dec")
##D   search_tables("acs1")
## End(Not run)





