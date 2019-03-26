library(RoughSets)


### Name: FS.permutation.heuristic.reduct.RST
### Title: The permutation heuristic algorithm for computation of a
###   decision reduct
### Aliases: FS.permutation.heuristic.reduct.RST

### ** Examples

###################################################
## Example 1: Generate reduct and new decision table
###################################################
data(RoughSetData)
decision.table <- RoughSetData$hiring.dt

## generate single reduct
res.1 <- FS.permutation.heuristic.reduct.RST(decision.table,
                                             permutation = NULL,
                                             decisionIdx = 5)
print(res.1)

res.2 <- FS.permutation.heuristic.reduct.RST(decision.table,
                                             permutation = 4:1,
                                             decisionIdx = 5)
print(res.2)

## generate new decision table according to the reduct
new.decTable <- SF.applyDecTable(decision.table, res.1)



