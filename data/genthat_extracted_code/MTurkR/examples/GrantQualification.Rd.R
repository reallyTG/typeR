library(MTurkR)


### Name: GrantQualification
### Title: Grant/Reject Qualification Request
### Aliases: GrantQualification GrantQualifications grantqual
###   RejectQualification RejectQualifications rejectrequest
### Keywords: Qualifications

### ** Examples

## Not run: 
##D # create QualificationType
##D qual1 <- CreateQualificationType(name="Requestable Qualification",
##D            description="This is a test qualification that can be requested.",
##D            status = "Active")
##D 
##D # poll for qualification requests
##D qrs <- GetQualificationRequests(qual1$QualificationTypeId)
##D 
##D # grant a qualification request
##D GrantQualification(qrs$QualificationRequestId[1], values = "100")
##D 
##D # correct a worker's score (note use of `SubjectId`, not `WorkerId`)
##D UpdateQualificationScore(qrs$QualificationTypeId[1], qrs$SubjectId[1], value = "95")
##D 
##D # reject a qualification request
##D RejectQualification(qrs$QualificationTypeId[2], reason = "Sorry!")
##D 
##D # cleanup
##D DisposeQualificationType(qual1$QualificationTypeId)
## End(Not run)



