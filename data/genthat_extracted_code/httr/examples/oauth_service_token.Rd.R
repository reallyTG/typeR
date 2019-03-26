library(httr)


### Name: oauth_service_token
### Title: Generate OAuth token for service accounts.
### Aliases: oauth_service_token

### ** Examples

## Not run: 
##D endpoint <- oauth_endpoints("google")
##D secrets <- jsonlite::fromJSON("~/Desktop/httrtest-45693cbfac92.json")
##D scope <- "https://www.googleapis.com/auth/bigquery.readonly"
##D 
##D token <- oauth_service_token(endpoint, secrets, scope)
## End(Not run)



