library(RoughSets)


### Name: FS.quickreduct.RST
### Title: QuickReduct algorithm based on RST
### Aliases: FS.quickreduct.RST

### ** Examples

###################################################
## Example 1: Evaluate reduct and generate
##            new decision table
###################################################
data(RoughSetData)
decision.table <- RoughSetData$hiring.dt

## evaluate single reduct
res.1 <- FS.quickreduct.RST(decision.table)

## generate new decision table according to the reduct
new.decTable <- SF.applyDecTable(decision.table, res.1)



