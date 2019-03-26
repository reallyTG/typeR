library(googleAnalyticsR)


### Name: ga_filter_add
### Title: Create a new filter and add it to the view (optional).
### Aliases: ga_filter_add

### ** Examples


## Not run: 
##D ## Create a filter object for adding an IP exclusion:
##D Filter <- list(
##D                name = 'Exclude Internal Traffic',
##D                type = 'EXCLUDE',
##D                excludeDetails = list(
##D                    field = 'GEO_IP_ADDRESS',
##D                    matchType = 'EQUAL',
##D                    expressionValue = '199.04.123.1',
##D                    caseSensitive = 'False'
##D                                     )
##D               )
##D 
##D # create and add the filter to the view specified      
##D my_filter <- ga_filter_add(Filter, 
##D                            accountId = 12345, 
##D                            webPropertyId = "UA-12345-1", 
##D                            viewId = 654321,
##D                            linkFilter = TRUE)
##D 
##D # only create the filter, don't apply it to any view - returns filterId for use later
##D my_filter <- ga_filter_add(Filter, 
##D                            accountId = 12345, 
##D                            linkFilter = FALSE)                          
##D 
##D ## Other examples of filters you can create below:
##D ## Create a filter object for making campaign medium lowercase
##D Filter <- list(
##D                name = 'Lowercase Campaign Medium',
##D                type = 'LOWERCASE',
##D                lowercaseDetails = list(
##D                    field = 'CAMPAIGN_MEDIUM'
##D                                     )
##D               )
##D 
##D ## Create a filter object to append hostname to URI
##D Filter <- list(
##D                name = 'Append hostname to URI',
##D                type = 'ADVANCED',
##D                advancedDetails = list(
##D                    fieldA = 'PAGE_HOSTNAME',
##D                    extractA = '(.*)',
##D                    fieldARequired = 'True',
##D                    fieldB = 'PAGE_REQUEST_URI',
##D                    extractB = '(.*)',
##D                    fieldBRequired = 'False',
##D                    outputConstructor = '$A1$B1',
##D                    outputToField = 'PAGE_REQUEST_URI',
##D                    caseSensitive = 'False',
##D                    overrideOutputField = 'True'
##D                                     )
##D               )
##D 
##D ## Create a filter object to add www hostname without it
##D Filter <- list(
##D                name = 'Search and Replace www',
##D                type = 'SEARCH_AND_REPLACE',
##D                searchAndReplaceDetails = list(
##D                    field = 'PAGE_HOSTNAME',
##D                    searchString = '^exampleUSA\\.com$',
##D                    replaceString = 'www.exampleUSA.com',
##D                    caseSensitive = 'False'
##D                                     )
##D               )
##D 
## End(Not run)




