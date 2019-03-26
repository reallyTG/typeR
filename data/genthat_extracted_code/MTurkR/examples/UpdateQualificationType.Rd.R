library(MTurkR)


### Name: UpdateQualificationType
### Title: Update a Worker QualificationType
### Aliases: UpdateQualificationType updatequal
### Keywords: Qualifications

### ** Examples

## Not run: 
##D qual1 <- 
##D CreateQualificationType(name="Worked for me before",
##D     description="This qualification is for people who have worked for me before",
##D     status = "Active",
##D     keywords="Worked for me before")
##D qual2 <- 
##D UpdateQualificationType(qual1$QualificationTypeId,
##D     description="This qualification is for everybody!",
##D     auto=TRUE, auto.value="5")
##D DisposeQualificationType(qual1$QualificationTypeId)
## End(Not run)



