library(uptimeRobot)


### Name: uptimerobot.contact.new
### Title: Add a new alert contact
### Aliases: uptimerobot.contact.new

### ** Examples

## Not run: 
##D  # Let's assume the api.key is available into the environment variable KEY
##D  api.key <- Sys.getenv("KEY", "")
##D  # Create a new contact and get the ID
##D  contact.new <- uptimerobot.contact.new(api.key, type = "email", value = "foo@bar.com", "John Doe")
##D 
##D  # Get informations about this new contact
##D  contact.detail <- uptimerobot.contacts(api.key, contacts = contact.new)
## End(Not run)



