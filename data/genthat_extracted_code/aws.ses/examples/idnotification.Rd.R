library(aws.ses)


### Name: get_id_notification
### Title: Get/Set Notifications
### Aliases: get_id_notification set_id_notification

### ** Examples

## Not run: 
##D # get
##D get_id_notifiaction("example@example.com")
##D 
##D # set
##D if (require("aws.sns")) {
##D   top <- create_topic("ses_email_bounce")
##D   set_id_notifiaction("example@example.com", "Bounce", top)
##D   get_id_notifiaction("example@example.com")
##D   
##D   # cleanup
##D   delete_topic(top)
##D }
## End(Not run)



