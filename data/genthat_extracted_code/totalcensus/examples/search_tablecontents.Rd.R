library(totalcensus)


### Name: search_tablecontents
### Title: Search Table Contents
### Aliases: search_tablecontents

### ** Examples

# Change view = TRUE (default) to View the returned data.
# search by what you want
aaa <- search_tablecontents("dec", 2000, "federal prison", view = FALSE)

# search by table reference
bbb <- search_tablecontents("acs1", 2010:2015, "B02003", view = FALSE)

## Not run: 
##D   # view all decennial census table contents
##D   search_tablecontents("dec")
##D 
##D   # view all ACS 5 year table contents
##D   search_tablecontents("acs5")
## End(Not run)




