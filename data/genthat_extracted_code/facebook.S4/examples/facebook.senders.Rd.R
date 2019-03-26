library(facebook.S4)


### Name: facebook.senders
### Title: Pull the list of senders from a set of inbox conversations
### Aliases: facebook.senders

### ** Examples

## Not run: 
##D ## See examples for fbOAuth to know how token was created.
##D  load("fb_oauth")
##D  
##D ## Returns the conversations of a given page
##D  conversations <- FacebookPagesCollection(id="9thcirclegames", fb_oauth) %>%
##D    FacebookConversationsCollection()
##D  
##D ## Who sent a message to the page
##D  senders <- facebook.senders(conversations) %>% FacebookUsersCollection()
## End(Not run)




