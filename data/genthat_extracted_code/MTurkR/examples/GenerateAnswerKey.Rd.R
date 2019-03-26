library(MTurkR)


### Name: GenerateAnswerKey
### Title: Generate AnswerKey Data Structure
### Aliases: GenerateAnswerKey AnswerKeyTemplate
### Keywords: Qualifications

### ** Examples

## Not run: 
##D # generate an AnswerKey from a list of arguments
##D qs <- list(list(QuestionIdentifier = "Question1",
##D                 AnswerOption = list(SelectionIdentifier="A", AnswerScore=15),
##D                 AnswerOption = list(SelectionIdentifier="B", AnswerScore=10),
##D                 DefaultScore = 5),
##D            list(QuestionIdentifier = "Question2",
##D                 AnswerOption = list(SelectionIdentifier="D", AnswerScore=10) ) )
##D 
##D scoring1 <- list(PercentageMapping=5)
##D 
##D scoring2 <- list(RangeMapping=list(list(InclusiveLowerBound=0,
##D                                         InclusiveUpperBound=20,
##D                                         QualificationValue=5),
##D                                    list(InclusiveLowerBound=21,
##D                                         InclusiveUpperBound=100,
##D                                         QualificationValue=10)),
##D                  OutOfRangeQualificationValue=0)
##D 
##D ak1 <- GenerateAnswerKey(qs, scoring1)
##D ak2 <- GenerateAnswerKey(qs, scoring2)
##D 
##D # generate an AnswerKey template from a QualificationTest
##D qt <- system.file("templates", "qualificationtest1.xml", package = "MTurkR")
##D akt <- AnswerKeyTemplate(xmlParse(qt))
##D # use the template to generate an AnswerKey
##D ak <- GenerateAnswerKey(ak)
## End(Not run)



