library(NlsyLinks)


### Name: Ace
### Title: Estimates the heritability of additive traits using a single
###   variable.
### Aliases: Ace AceUnivariate DeFriesFulkerMethod1 DeFriesFulkerMethod3

### ** Examples

library(NlsyLinks) #Load the package into the current R session.
dsOutcomes <- ExtraOutcomes79
dsOutcomes$SubjectTag <- CreateSubjectTag(subjectID=dsOutcomes$SubjectID,
  generation=dsOutcomes$Generation)
dsLinks <- Links79Pair
dsLinks <- dsLinks[dsLinks$RelationshipPath=='Gen2Siblings', ] #Only Gen2 Sibs (ie, NLSY79C)
dsDF <- CreatePairLinksDoubleEntered(outcomeDataset=dsOutcomes, linksPairDataset=dsLinks, 
  outcomeNames=c("MathStandardized", "HeightZGenderAge", "WeightZGenderAge"))

estimatedAdultHeight <- DeFriesFulkerMethod3(
  dataSet=dsDF,    
  oName_S1="HeightZGenderAge_S1", 
  oName_S2="HeightZGenderAge_S2")  
estimatedAdultHeight #ASquared and CSquared should be 0.60 and 0.10 for this rough analysis.

estimatedMath <- DeFriesFulkerMethod3(
  dataSet=dsDF,    
  oName_S1="MathStandardized_S1", 
  oName_S2="MathStandardized_S2")
estimatedMath #ASquared and CSquared should be 0.85 and 0.045.

class(GetDetails(estimatedMath))
summary(GetDetails(estimatedMath))





