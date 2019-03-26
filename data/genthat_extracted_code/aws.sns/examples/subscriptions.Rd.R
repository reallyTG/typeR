library(aws.sns)


### Name: subscribe
### Title: Subscribe/Unsubscribe to a topic
### Aliases: subscribe unsubscribe

### ** Examples

## Not run: 
##D   top <- create_topic("new_topic")
##D   # email subscription
##D   subscribe(top, "example@example.com", protocol = "email")
##D 
##D   # sms subscription
##D   subscribe(top, "555-123-4567", protocol = "sms")
##D 
##D   delete_topic(top)
## End(Not run)




