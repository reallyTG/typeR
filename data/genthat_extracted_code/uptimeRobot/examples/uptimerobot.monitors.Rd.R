library(uptimeRobot)


### Name: uptimerobot.monitors
### Title: Get general informations about monitors
### Aliases: uptimerobot.monitors

### ** Examples

## Not run: 
##D # Let's assume the api.key is available into the environment variable KEY
##D api.key <- Sys.getenv("KEY", "")
##D 
##D # Returns all the  monitors with a default set of attributes
##D monitors.df <- uptimerobot.monitors(api.key)
##D 
##D #' # Returns all the monitors of 'keyword' type
##D monitors.kwd..df <- uptimerobot.monitors(api.key, type="keyword")
##D 
##D # Returns all the monitors and all the attributes
##D monitors.full.df <- uptimerobot.monitors(api.key, fields=uptimerobot.fields("monitor")$full))
##D 
##D # Returns only the two monitors with ID: 1234, 5678
##D monitors.df <- uptimerobot.monitors(api.key, c("1234", "5678"))
## End(Not run)



