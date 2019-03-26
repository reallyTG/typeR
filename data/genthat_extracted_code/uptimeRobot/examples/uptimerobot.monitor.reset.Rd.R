library(uptimeRobot)


### Name: uptimerobot.monitor.reset
### Title: Reset a monitor
### Aliases: uptimerobot.monitor.reset

### ** Examples

## Not run: 
##D  # Let's assume the api.key is available into the environment variable KEY
##D  api.key <- Sys.getenv("KEY", "")
##D 
##D # Get a list of all available monitors, and take the first id
##D monitors.id <- uptimerobot.monitors(api.key, fields="id")[1,1]
##D 
##D  # Reset the stats for that monitor
##D  uptimerobot.monitor.reset(api.key, monitor.id)
##D 
## End(Not run)



