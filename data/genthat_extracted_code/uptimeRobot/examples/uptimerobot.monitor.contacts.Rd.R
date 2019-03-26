library(uptimeRobot)


### Name: uptimerobot.monitor.contacts
### Title: Get contacts informations for one or more monitors
### Aliases: uptimerobot.monitor.contacts

### ** Examples

## Not run: 
##D # Let's assume the api.key is available into the environment variable KEY
##D api.key <- Sys.getenv("KEY", "")
##D 
##D # Returns all the monitors IDs. Since the function always return a data.frame
##D # (even if you ask only for a column), you have to reference the column to get a character vector.
##D monitors.id <- uptimerobot.monitors(api.key, fields="id")$id
##D 
##D # Returns all the contacts registered for the given monitors
##D logs.df <- uptimerobot.monitor.contacts(api.key, monitors=monitors.id)
## End(Not run)



