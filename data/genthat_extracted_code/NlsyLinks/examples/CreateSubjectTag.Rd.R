library(NlsyLinks)


### Name: CreateSubjectTag
### Title: Creates a 'SubjectTag'.  This value uniquely identifies
###   subjects, when both generations are included in the same dataset.
### Aliases: CreateSubjectTag

### ** Examples

library(NlsyLinks) #Load the package into the current R session.
  
#Typically these two vectors will come from a data frame.
subjectIDs <- c(71:82, 10001:10012)
generation <- c(rep(1, 12), rep(2, 12))
  
CreateSubjectTag(subjectIDs, generation)
#Returns 7100, ..., 8200, 10001, ..., 10012
  
#Use the ExtraOutcomes79 dataset, with numeric variables 'SubjectID' and 'Generation'.
ExtraOutcomes79$SubjectTag <- CreateSubjectTag(
   subjectID=ExtraOutcomes79$SubjectID, 
   generation=ExtraOutcomes79$Generation
)




