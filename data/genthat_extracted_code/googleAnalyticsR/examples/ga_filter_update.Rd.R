library(googleAnalyticsR)


### Name: ga_filter_update
### Title: Updates an existing filter.
### Aliases: ga_filter_update

### ** Examples


## Not run: 
##D 
##D # create a filter object
##D Filter <- list(
##D     name = 'googleAnalyticsR test1: Exclude Internal Traffic',
##D     type = 'EXCLUDE',
##D     excludeDetails = list(
##D                       field = 'GEO_IP_ADDRESS',
##D                       matchType = 'EQUAL',
##D                       expressionValue = '199.04.123.1',
##D                       caseSensitive = 'False'
##D                       )
##D                  )
##D  # add a filter (but don't link to a View)               
##D  filterId <- ga_filter_add(Filter, 
##D                            accountId = 123456, 
##D                            linkFilter = FALSE)
##D  
##D  # change the name of the filter                    
##D  change_name <- "googleAnalyticsR test2: Changed name via PATCH"
##D  
##D  # using PATCH semantics, only need to construct what you want to change
##D  filter_to_update <- list(name = test_name)
##D  
##D  # update the filter using the filterId 
##D  ga_filter_update(filter_to_update, accountId2, filterId, method = "PATCH")
##D 
## End(Not run)




