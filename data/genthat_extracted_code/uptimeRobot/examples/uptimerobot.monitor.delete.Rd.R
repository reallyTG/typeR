library(uptimeRobot)


### Name: uptimerobot.monitor.delete
### Title: Delete a monitor
### Aliases: uptimerobot.monitor.delete

### ** Examples

## Not run: 
##D  # Let's assume the api.key is available into the environment variable KEY
##D  api.key <- Sys.getenv("KEY", "")
##D 
##D  # Create a monitor and get its monitor.id
##D  monitor.id <- uptimerobot.monitor.new(api.key,
##D    friendly.name="Open Analytics",
##D    url="https://gabrielebaldassarre.com", type="http"
##D  )
##D 
##D  # Change the friendly name of the monitor
##D   if(uptimerobot.monitor.edit(api.key,
##D      monitor.id,
##D      friendly.name="Open Analytics - gabrielebaldassarre.com"
##D   ){
##D    message("Monitor has been successfully edited!")
##D  }
##D 
##D  # Delete the just-made monitor
##D  if(uptimerobot.monitor.delete(api.key, monitor.id){
##D    message("Monitor has been successfully deleted!")
##D  }
## End(Not run)



