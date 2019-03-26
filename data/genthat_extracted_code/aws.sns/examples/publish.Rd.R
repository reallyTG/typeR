library(aws.sns)


### Name: publish
### Title: Publish to a topic or endpoint
### Aliases: publish

### ** Examples

## Not run: 
##D   top <- create_topic("new_topic")
##D 
##D   # simple notifications
##D   publish(top, message = "This is a notification message", subject = "Notification!")
##D 
##D   # endpoint-specific notification
##D   publish(top, message = list(sms = "This is an sms message", 
##D                               email = "This is an email"), 
##D           subject = "Notification!")
##D 
##D   delete_topic(top)
## End(Not run)




