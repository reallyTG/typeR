library(RoughSets)


### Name: as.character.RuleSetRST
### Title: The 'as.character' method for RST rule sets
### Aliases: as.character.RuleSetRST

### ** Examples

###########################################################
## Example : Converting a set of decision rules
###########################################################
data(RoughSetData)
hiring.data <- RoughSetData$hiring.dt

rules <- RI.LEM2Rules.RST(hiring.data)

as.character(rules)



