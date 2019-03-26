library(RoughSets)


### Name: as.list.RuleSetRST
### Title: The 'as.list' method for RST rule sets
### Aliases: as.list.RuleSetRST

### ** Examples

###########################################################
## Example : Converting a set of decision rules
###########################################################
data(RoughSetData)
hiring.data <- RoughSetData$hiring.dt

rules <- RI.LEM2Rules.RST(hiring.data)

as.list(rules)



