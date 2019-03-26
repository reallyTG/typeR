library(MTurkR)


### Name: GetQualificationScore
### Title: Get a Worker's Qualification Score
### Aliases: GetQualificationScore qualscore
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
##D GetQualificationScore(qual1$QualificationTypeId, qual1$WorkerId)
##D 
##D # cleanup
##D DisposeQualificationType(qual1$QualificationTypeId)
## End(Not run)



