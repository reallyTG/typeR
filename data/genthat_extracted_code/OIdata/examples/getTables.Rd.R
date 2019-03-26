library(OIdata)


### Name: getTables
### Title: Get the tables from a web page
### Aliases: getTables rowScrape stripTags scrapeTable print.htmlTables
### Keywords: web scrape

### ** Examples

## Not run: 
##D URL     <- "http://en.wikipedia.org/wiki/Poverty_in_the_United_States"
##D Tables  <- getTables(URL)
##D thisOne <- which(sapply(Tables, "[", 1, 1) == "Persons in Family Unit")
##D if(length(thisOne) > 0){
##D   Tables[[thisOne[1]]]
##D }
## End(Not run)



