library(rtweet)


### Name: rate_limit
### Title: Get rate limit data for given Twitter access tokens.
### Aliases: rate_limit rate_limits

### ** Examples


## Not run: 
##D 
##D ## get all rate_limit information for default token
##D rate_limit()
##D 
##D ## get rate limit info for API used in lookup_statuses
##D rate_limit("lookup_statuses")
##D 
##D ## get rate limit info for specific token
##D token <- get_tokens()
##D rate_limit(token)
##D rate_limit(token, "search_tweets")
##D 
## End(Not run)




