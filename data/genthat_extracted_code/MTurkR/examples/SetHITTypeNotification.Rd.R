library(MTurkR)


### Name: SetHITTypeNotification
### Title: Configure a HITType Notification
### Aliases: SetHITTypeNotification setnotification
### Keywords: Notifications

### ** Examples

## Not run: 
##D # setup email notification
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

## Not run: 
##D # setup SQS notification
##D hittype <- 
##D RegisterHITType(title="10 Question Survey",
##D                 description=
##D                 "Complete a 10-question survey about news coverage and your opinions",
##D                 reward=".20", 
##D                 duration=seconds(hours=1), 
##D                 keywords="survey, questionnaire, politics")
##D 
##D b <- GenerateNotification("https://sqs.us-east-1.amazonaws.com/123456789/Example", 
##D                           transport = "SQS", 
##D                           event.type = "HITExpired")
##D SetHITTypeNotification(hit.type = hittype$HITTypeId, 
##D                        notification = b,
##D                        active = TRUE)
##D # send test notification
##D SendTestEventNotification(b, test.event.type="HITExpired")
## End(Not run)



