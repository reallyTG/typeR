library(MTurkR)


### Name: UpdateQualificationScore
### Title: Update a worker's score for a QualificationType
### Aliases: UpdateQualificationScore updatequalscore
### Keywords: Qualifications

### ** Examples

## Not run: 
##D qual1 <- 
##D CreateQualificationType(name="Worked for me before",
##D     description="This qualification is for people who have worked for me before",
##D     status = "Active",
##D     keywords="Worked for me before")
##D AssignQualification(qual1$QualificationTypeId, "A1RO9UJNWXMU65", value="50")
##D UpdateQualificationScore(qual1$QualificationTypeId, "A1RO9UJNWXMU65", value="95")
##D UpdateQualificationScore(qual1$QualificationTypeId, "A1RO9UJNWXMU65", increment="1")
##D DisposeQualificationType(qual1$QualificationTypeId)
## End(Not run)



