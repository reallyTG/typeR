library(RoughSets)


### Name: FS.feature.subset.computation
### Title: The superreduct computation based on RST and FRST
### Aliases: FS.feature.subset.computation

### ** Examples

###############################################################
## Example 1: generate reduct and new decision table using RST
###############################################################
data(RoughSetData)
decision.table <- RoughSetData$hiring.dt

## generate single superreduct
res.1 <- FS.feature.subset.computation(decision.table,
                                       method = "quickreduct.rst")

## generate new decision table according to the reduct
new.decTable <- SF.applyDecTable(decision.table, res.1)

###############################################################
## Example 2: generate reduct and new decision table using FRST
###############################################################
data(RoughSetData)
decision.table <- RoughSetData$housing7.dt

## generate single superreduct
res.2 <- FS.feature.subset.computation(decision.table,
                                       method = "quickreduct.frst")

## generate new decision table according to the reduct
new.decTable <- SF.applyDecTable(decision.table, res.2)



