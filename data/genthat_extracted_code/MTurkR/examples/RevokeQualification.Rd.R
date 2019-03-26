library(MTurkR)


### Name: RevokeQualification
### Title: Revoke a Qualification from a Worker
### Aliases: RevokeQualification RevokeQualifications revokequal
### Keywords: Qualifications

### ** Examples

## Not run: 
##D qual1 <- 
##D AssignQualification(workers = "A1RO9UJNWXMU65",
##D                     name = "Worked for me before",
##D                     description = "This qualification is for people who have worked for me before",
##D                     status = "Active",
##D                     keywords = "Worked for me before")
##D 
##D RevokeQualification(qual = qual1$QualificationTypeId,
##D                     worker = qual1$WorkerId,
##D                     reason = "No longer needed")
##D 
##D DisposeQualificationType(qual1$QualificationTypeId)
##D 
## End(Not run)



