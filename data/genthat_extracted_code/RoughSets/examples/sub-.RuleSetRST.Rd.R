library(RoughSets)


### Name: [.RuleSetRST
### Title: The '[.' method for '"RuleSetRST"' objects
### Aliases: Extract.RuleSetRST [.RuleSetRST

### ** Examples

###########################################################
## Example : Subsetting a set of decision rules
###########################################################
data(RoughSetData)
hiring.data <- RoughSetData$hiring.dt

rules <- RI.LEM2Rules.RST(hiring.data)

rules

# taking a subset of rules
rules[1:3]
rules[c(TRUE,FALSE,TRUE,FALSE)]

# replacing a subset of rules
rules2 <- rules
rules2[c(2,4)] <- rules[c(1,3)]
rules2



