library(uptimeRobot)


### Name: uptimerobot.account.details
### Title: Get the account details for who is linked to the given API key
### Aliases: uptimerobot.account.details

### ** Examples

## Not run: 
##D # Let's assume the api.key is available into the environment variable KEY
##D api.key <- Sys.getenv("KEY", "")
##D 
##D # Returns details as a list
##D details.list <- uptimerobot.account.details(api.key)
##D 
##D # Returns details as a vector
##D details.num <- uptimerobot.account.details(api.key, unlist = TRUE)
## End(Not run)



