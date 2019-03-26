library(RoughSets)


### Name: FS.greedy.heuristic.reduct.RST
### Title: The greedy heuristic algorithm for computing decision reducts
###   and approximate decision reducts
### Aliases: FS.greedy.heuristic.reduct.RST

### ** Examples

###################################################
## Example 1: Evaluate reduct and generate
##            new decision table
###################################################
data(RoughSetData)
decision.table <- RoughSetData$hiring.dt

## evaluate a single reduct
res.1 <- FS.greedy.heuristic.reduct.RST(decision.table, qualityF = X.entropy,
                                        epsilon = 0.0)

## generate a new decision table corresponding to the reduct
new.decTable <- SF.applyDecTable(decision.table, res.1)



