library(MachineLearning)


### Name: AssociationRules
### Title: Simple way to obtain data mining rules
### Aliases: AssociationRules AsociationRules

### ** Examples

## Load a Dataset
data(EGATUR)
## Generate an asociation rules with apriori, remmember only support discretized variables,
##  in this remove numerical variables.
Rules <- AsociationRules(EGATUR[,c(2,4,5,8)])




