library(rdfp)


### Name: dfp_createCustomTargetingValues
### Title: createCustomTargetingValues
### Aliases: dfp_createCustomTargetingValues

### ** Examples

## Not run: 
##D request_data <- data.frame(customTargetingKeyId=rep(created_targeting_key$id,2),
##D                            name=c('TestValue1','TestValue2'), 
##D                            displayName=c('TestValue1','TestValue2'), 
##D                            matchType=rep('EXACT', 2))
##D result <- dfp_createCustomTargetingValues(request_data)
## End(Not run)



