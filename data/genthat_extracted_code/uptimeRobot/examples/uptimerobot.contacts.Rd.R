library(uptimeRobot)


### Name: uptimerobot.contacts
### Title: Get general informations about the alert contacts
### Aliases: uptimerobot.contacts

### ** Examples

## Not run: 
##D # Let's assume the api.key is available into the environment variable KEY
##D api.key <- Sys.getenv("KEY", "")
##D 
##D # Returns all the contacts with a default set of attributes
##D contacts.df <- uptimerobot.contacts(api.key)
##D 
##D # Returns all the contacts and all the attributes
##D contacts.full.df <- uptimerobot.contacts(api.key, fields=uptimerobot.fields("contact")$full))
##D 
##D # Returns only the two contacts with ID: 1234, 5678
##D contacts.df <- uptimerobot.contacts(api.key, c("1234", "5678"))
## End(Not run)



