library(RoughSets)


### Name: FS.DAAR.heuristic.RST
### Title: The DAAR heuristic for computation of decision reducts
### Aliases: FS.DAAR.heuristic.RST

### ** Examples

###################################################
## Example 1: Evaluate reduct and generate
##            new decision table
###################################################
data(RoughSetData)
decision.table <- RoughSetData$hiring.dt

## evaluate a single reduct
res.1 <- FS.DAAR.heuristic.RST(decision.table)

## generate a new decision table corresponding to the reduct
new.decTable <- SF.applyDecTable(decision.table, res.1)



