library(RoughSets)


### Name: FS.reduct.computation
### Title: The reduct computation methods based on RST and FRST
### Aliases: FS.reduct.computation

### ** Examples

##############################################################
## Example 1: generate reduct and new decision table
## using RST and FRST
##############################################################
data(RoughSetData)
decision.table <- RoughSetData$hiring.dt

## generate a single reduct using RST
reduct.1 <- FS.reduct.computation(decision.table, method = "greedy.heuristic")

## generate a single reduct using FRST
reduct.2 <- FS.reduct.computation(decision.table, method = "nearOpt.fvprs")

## generate a new decision table using reduct.1
new.decTable.1 <- SF.applyDecTable(decision.table, reduct.1)

## generate new decision table using reduct.2
new.decTable.2 <- SF.applyDecTable(decision.table, reduct.2)



