library(searchConsoleR)


### Name: search_analytics
### Title: Query search traffic keyword data
### Aliases: search_analytics

### ** Examples


## Not run: 
##D 
##D    library(searchConsoleR)
##D    scr_auth()
##D    sc_websites <- list_websites()
##D    
##D    default_fetch <- search_analytics("http://www.example.com")
##D 
##D    gbr_desktop_queries <-
##D        search_analytics("http://www.example.com",
##D                          start = "2016-01-01", end = "2016-03-01",
##D                          dimensions = c("query", "page"),
##D                          dimensionsFilterExp = c("device==DESKTOP", "country==GBR"),
##D                          searchType = "web", rowLimit = 100)
##D 
##D    batching <-
##D         search_analytics("http://www.example.com",
##D                          start = "2016-01-01", end = "2016-03-01",
##D                          dimensions = c("query", "page", "date"),
##D                          searchType = "web", rowLimit = 100000,
##D                          walk_data = "byBatch")
##D 
##D   
## End(Not run)



