library(MTurkR)


### Name: AssignQualification
### Title: Assign Qualification
### Aliases: AssignQualification AssignQualifications assignqual
### Keywords: Qualifications

### ** Examples

## Not run: 
##D qual1 <- 
##D CreateQualificationType(name="Worked for me before",
##D     description="This qualification is for people who have worked for me before",
##D     status = "Active",
##D     keywords="Worked for me before")
##D 
##D # assign qualification to single worker
##D AssignQualification(qual1$QualificationTypeId, "A1RO9UJNWXMU65", value = "50")
##D 
##D # assign a new qualification (defined atomically)
##D AssignQualification(workers = "A1RO9UJNWXMU65",
##D                     name = "Worked for me before",
##D                     description = "This qualification is for people who have worked for me before",
##D                     status = "Active",
##D                     keywords = "Worked for me before")
##D 
##D # assign a qualification to a workers based upon their worker statistic
##D AssignQualification(qual1$QualificationTypeId,
##D     workers="A1RO9UJNWXMU65",
##D     conditional.statistic="NumberAssignmentsApproved",
##D     conditional.comparator=">", 
##D     conditional.value="5", 
##D     conditional.period="LifeToDate", 
##D     set.statistic.as.value=TRUE)
##D 
##D DisposeQualificationType(qual1$QualificationTypeId)
## End(Not run)



