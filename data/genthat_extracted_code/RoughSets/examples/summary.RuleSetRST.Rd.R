library(RoughSets)


### Name: summary.RuleSetRST
### Title: The summary function of rules based on RST
### Aliases: summary.RuleSetRST

### ** Examples

###########################################################
## Example : Classification problem
###########################################################
data(RoughSetData)
decision.table <- RoughSetData$hiring.dt

## determine feature subset/reduct
reduct <- FS.permutation.heuristic.reduct.RST(decision.table,  permutation = NULL)

rules <- RI.indiscernibilityBasedRules.RST(decision.table, reduct)

summary(rules)



