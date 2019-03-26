library(NlsyLinks)


### Name: ValidateOutcomeDataset
### Title: Validates the schema of datasets containing outcome variables.
### Aliases: ValidateOutcomeDataset
### Keywords: validation

### ** Examples

library(NlsyLinks) #Load the package into the current R session.
ds <- ExtraOutcomes79
outcomeNames <- c("MathStandardized", "WeightZGenderAge")
ValidateOutcomeDataset(dsOutcome=ds, outcomeNames=outcomeNames) #Returns TRUE.
outcomeNamesBad <- c("MathMisspelled", "WeightZGenderAge")
#ValidateOutcomeDataset(dsOutcome=ds, outcomeNames=outcomeNamesBad) #Throws error.




