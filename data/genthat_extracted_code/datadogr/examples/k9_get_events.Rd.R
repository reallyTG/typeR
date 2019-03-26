library(datadogr)


### Name: k9_get_events
### Title: Get Events
### Aliases: k9_get_events

### ** Examples

## Not run: 
##D # by default get all events happend from an hour ago
##D k9_get_events()
##D 
##D # get all events happend in this week
##D k9_get_events(start = Sys.Date() - 7, end = Sys.Date())
##D 
##D # specify an event by ID
##D k9_get_events(event_id = "112233445566")
##D 
##D # specify tag
##D k9_get_events(tags = list(role = "db"))
## End(Not run)




