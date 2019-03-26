library(RoughSets)


### Name: FS.nearOpt.fvprs.FRST
### Title: The near-optimal reduction algorithm based on fuzzy rough set
###   theory
### Aliases: FS.nearOpt.fvprs.FRST

### ** Examples

#########################################################
## Example 1: Hiring dataset containing 8 objects with 5 attributes
#########################################################
## Not run: 
##D data(RoughSetData)
##D decision.table <- RoughSetData$hiring.dt
##D 
##D ## get reduct as FeatureSubset class
##D reduct.1 <- FS.nearOpt.fvprs.FRST(decision.table)
##D 
##D ## get new decision table according to the reduct
##D new.decTable <- SF.applyDecTable(decision.table, reduct.1)
## End(Not run)

#########################################################
## Example 2: Pima dataset containing 7 objects with 9 attributes
#########################################################
data(RoughSetData)
decision.table <- RoughSetData$pima7.dt

## get reduct
reduct.2 <- FS.nearOpt.fvprs.FRST(decision.table)

## get new decision table according to the reduct
new.decTable <- SF.applyDecTable(decision.table, reduct.2)



