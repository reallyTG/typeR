library(MTurkR)


### Name: SendTestEventNotification
### Title: Test a Notification
### Aliases: SendTestEventNotification notificationtest
### Keywords: Notifications

### ** Examples

## Not run: 
##D hittype <- 
##D RegisterHITType(title="10 Question Survey",
##D                 description=
##D                 "Complete a 10-question survey about news coverage and your opinions",
##D                 reward=".20", 
##D                 duration=seconds(hours=1), 
##D                 keywords="survey, questionnaire, politics")
##D 
##D a <- GenerateNotification("requester@example.com", event.type = "HITExpired")
##D SetHITTypeNotification(hit.type = hittype$HITTypeId, 
##D                        notification = a,
##D                        active = TRUE)
##D # send test notification
##D SendTestEventNotification(a, test.event.type="HITExpired")
## End(Not run)



