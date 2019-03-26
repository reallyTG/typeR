library(MTurkR)


### Name: GetQualifications
### Title: Get Qualifications
### Aliases: GetQualifications getquals
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
##D GetQualifications(qual1$QualificationTypeId)
##D RevokeQualification(qual1$QualificationTypeId, qual1$WorkerId)
##D GetQualifications(qual1$QualificationTypeId, status="Revoked")
##D 
##D DisposeQualificationType(qual1$QualificationTypeId)
## End(Not run)



