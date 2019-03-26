library(RoughSets)


### Name: FS.greedy.heuristic.superreduct.RST
### Title: The greedy heuristic method for determining superreduct based on
###   RST
### Aliases: FS.greedy.heuristic.superreduct.RST

### ** Examples

###################################################
## Example 1: Evaluate reduct and generate
##            new decision table
###################################################
data(RoughSetData)
decision.table <- RoughSetData$hiring.dt

## evaluate single reduct
res.1 <- FS.greedy.heuristic.superreduct.RST(decision.table, qualityF = X.nOfConflicts)
print(res.1)

## generate new decision table according to the reduct
new.decTable <- SF.applyDecTable(decision.table, res.1)



