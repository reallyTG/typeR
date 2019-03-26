library(facebook.S4)


### Name: facebook.participants
### Title: Pull the list of participants from a set of inbox conversations
### Aliases: facebook.participants

### ** Examples

## Not run: 
##D ## See examples for fbOAuth to know how token was created.
##D  load("fb_oauth")
##D  
##D ## Returns the conversations of the current user
##D  my.conversations <- FacebookUsersCollection(id="me", fb_oauth) %>%
##D     FacebookConversationsCollection()
##D  
##D ## Who talks to the current users
##D  participants <- facebook.participants(my.conversations) %>% FacebookUsersCollection()
## End(Not run)




