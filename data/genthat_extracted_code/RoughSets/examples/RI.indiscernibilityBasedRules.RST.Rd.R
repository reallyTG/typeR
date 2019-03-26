library(RoughSets)


### Name: RI.indiscernibilityBasedRules.RST
### Title: Rule induction from indiscernibility classes.
### Aliases: RI.indiscernibilityBasedRules.RST

### ** Examples

###########################################################
## Example
##############################################################
data(RoughSetData)
hiring.data <- RoughSetData$hiring.dt

## determine feature subset/reduct
reduct <- FS.reduct.computation(hiring.data,
                                method = "permutation.heuristic",
                                permutation = FALSE)

rules <- RI.indiscernibilityBasedRules.RST(hiring.data, reduct)
rules



