library(MTurkR)


### Name: CreateQualificationType
### Title: Create QualificationType
### Aliases: CreateQualificationType createqual
### Keywords: Qualifications

### ** Examples

## Not run: 
##D # Create 
##D qual1 <- CreateQualificationType(name="Worked for me before",
##D            description="This qualification is for people who have worked for me before",
##D            status = "Active",
##D            keywords="Worked for me before")
##D DisposeQualificationType(qual1$QualificationTypeId)
## End(Not run)

## Not run: 
##D # QualificationType with test and answer key
##D qf <- paste0(readLines(system.file("qualificationtest1.xml", package = "MTurkR")), collapse="")
##D qa <- paste0(readLines(system.file("answerkey1.xml", package = "MTurkR")), collapse="")
##D qual1 <- CreateQualificationType(name = "Qualification with Test",
##D            description = "This qualification is a demo",
##D            test = qf,
##D            answerkey = qa, # optionally, use AnswerKey
##D            status = "Active",
##D            keywords = "test, autogranted")
##D DisposeQualificationType(qual1$QualificationTypeId)
## End(Not run)




