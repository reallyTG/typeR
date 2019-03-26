library(RoughSets)


### Name: FS.one.reduct.computation
### Title: Computing one reduct from a discernibility matrix
### Aliases: FS.one.reduct.computation

### ** Examples

########################################################
## Example 1: Generate one reducts and
##            a new decision table using RST
########################################################
data(RoughSetData)
decision.table <- RoughSetData$hiring.dt

## build the decision-relation discernibility matrix
res.1 <- BC.discernibility.mat.RST(decision.table, range.object = NULL)

## generate all reducts
reduct <- FS.one.reduct.computation(res.1)

## generate new decision table
new.decTable <- SF.applyDecTable(decision.table, reduct, control = list(indx.reduct = 1))

##############################################################
## Example 2: Generate one reducts and
##            a new decision table using FRST
##############################################################
data(RoughSetData)
decision.table <- RoughSetData$hiring.dt

## build the decision-relation discernibility matrix
control <- list(type.relation = c("crisp"),
                type.aggregation = c("crisp"),
                t.implicator = "lukasiewicz", type.LU = "implicator.tnorm")
res.2 <- BC.discernibility.mat.FRST(decision.table, type.discernibility = "standard.red",
                                    control = control)

## generate single reduct
reduct <- FS.one.reduct.computation(res.2)

## generate new decision table
new.decTable <- SF.applyDecTable(decision.table, reduct, control = list(indx.reduct = 1))



