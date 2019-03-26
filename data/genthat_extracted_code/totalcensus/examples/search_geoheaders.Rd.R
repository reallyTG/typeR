library(totalcensus)


### Name: search_geoheaders
### Title: Search Geographic Headers
### Aliases: search_geoheaders

### ** Examples

# Change view = TRUE (default) to View the returned data.
# search geoheader that contains keyword "india" in decennial 2010
aaa <- search_geoheaders("decennial", "india", view = FALSE)

# search for lattitude
bbb <- search_geoheaders("dec", 2010, "latitu", view = FALSE)


## Not run: 
##D   # browse all geoheaders in ACS i year in View()
##D   search_geoheaders("acs1")
## End(Not run)




