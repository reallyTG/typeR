library(NlsyLinks)


### Name: ValidatePairLinksAreSymmetric
### Title: Verifies that the pair relationships are symmetric.
### Aliases: ValidatePairLinksAreSymmetric
### Keywords: validation

### ** Examples


dsSingleLinks <- data.frame(
  ExtendedID=c(1, 1, 1, 2), 
  SubjectTag_S1=c(101, 101, 102, 201), 
  SubjectTag_S2=c(102, 103, 103, 202), 
  R=c(.5, .25, .25, .5), 
  RelationshipPath=rep("Gen2Siblings", 4)
)
dsSingleOutcomes <- data.frame(
  SubjectTag=c(101, 102, 103, 201, 202), 
  DV1=c(11, 12, 13, 41, 42), 
  DV2=c(21, 22, 23, 51, 52))
dsDouble <- CreatePairLinksDoubleEntered(
  outcomeDataset=dsSingleOutcomes, 
  linksPairDataset=dsSingleLinks, 
  outcomeNames=c("DV1", "DV2"), 
  validateOutcomeDataset=TRUE)
dsDouble #Show the 8 rows in the double-entered pair links
summary(dsDouble) #Summarize the variables

ValidatePairLinksAreSymmetric(dsDouble) #Should return TRUE.





