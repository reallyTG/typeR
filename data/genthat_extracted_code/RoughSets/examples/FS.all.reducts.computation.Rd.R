library(RoughSets)


### Name: FS.all.reducts.computation
### Title: A function for computing all decision reducts of a decision
###   system
### Aliases: FS.all.reducts.computation

### ** Examples

########################################################
## Example 1: Generate all reducts and
##            a new decision table using RST
########################################################
data(RoughSetData)
decision.table <- RoughSetData$hiring.dt

## build the decision-relation discernibility matrix
res.2 <- BC.discernibility.mat.RST(decision.table, range.object = NULL)

## generate all reducts
reduct <- FS.all.reducts.computation(res.2)

## generate new decision table
new.decTable <- SF.applyDecTable(decision.table, reduct, control = list(indx.reduct = 1))

##############################################################
## Example 2: Generate all reducts and
##            a new decision table using FRST
##############################################################
## Not run: 
##D data(RoughSetData)
##D decision.table <- RoughSetData$hiring.dt
##D 
##D ## build the decision-relation discernibility matrix
##D control.1 <- list(type.relation = c("crisp"),
##D                 type.aggregation = c("crisp"),
##D                 t.implicator = "lukasiewicz", type.LU = "implicator.tnorm")
##D res.1 <- BC.discernibility.mat.FRST(decision.table, type.discernibility = "standard.red",
##D                                     control = control.1)
##D 
##D ## generate single reduct
##D reduct <- FS.all.reducts.computation(res.1)
##D 
##D ## generate new decision table
##D new.decTable <- SF.applyDecTable(decision.table, reduct, control = list(indx.reduct = 1))
## End(Not run)



