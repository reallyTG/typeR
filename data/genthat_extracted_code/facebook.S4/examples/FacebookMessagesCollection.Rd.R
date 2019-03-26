library(facebook.S4)


### Name: FacebookMessagesCollection
### Title: Build a collection of Facebook inbox messages
### Aliases: FacebookMessagesCollection

### ** Examples

## Not run: 
##D ## See examples for fbOAuth to know how token was created.
##D  load("fb_page_oauth")
##D  
##D ## Getting the messages of the first conversation of an example page.
##D ## A page access token is needed to access the inbox
##D  messages <- FacebookPagesCollection("9thcirclegames", fb_page_oauth) %>%
##D              FacebookConversationsCollection(n = 1) %>%
##D              FacebookMessagesCollection()
## End(Not run)




