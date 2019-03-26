library(googleAnalyticsR)


### Name: ga_filter_update_filter_link
### Title: Update an existing profile filter link. Patch semantics
###   supported
### Aliases: ga_filter_update_filter_link

### ** Examples


## Not run: 
##D 
##D # create a filter object
##D Filter <- list(
##D  name = 'googleAnalyticsR test: Exclude Internal Traffic',
##D  type = 'EXCLUDE',
##D  excludeDetails = list(
##D    field = 'GEO_IP_ADDRESS',
##D    matchType = 'EQUAL',
##D    expressionValue = '199.04.123.1',
##D    caseSensitive = 'False'
##D    )
##D  )
##D  
##D  # link Filter to a View
##D  response <- ga_filter_add(Filter, 
##D                            accountId = 12345, 
##D                            webPropertyId = "UA-12345-1", 
##D                            viewId = 654321, 
##D                            linkFilter = TRUE)
##D                            
##D # create Filter patch to move existing filter up to rank 1
##D viewFilterLink <- list(rank = 1)
##D 
##D # use the linkId given in response$id to update to new rank 1
##D response2 <- ga_filter_update_filter_link(viewFilterLink, 
##D                                           accountId = 12345, 
##D                                           webPropertyId = "UA-12345-1", 
##D                                           viewId = 654321,  
##D                                           linkId = response$id)
##D 
## End(Not run)




