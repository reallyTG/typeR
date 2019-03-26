library(RoughSets)


### Name: print.FeatureSubset
### Title: The print method of FeatureSubset objects
### Aliases: print.FeatureSubset

### ** Examples

###########################################################
## Example : Computation of a decision reduct
###########################################################
data(RoughSetData)
decision.table <- RoughSetData$hiring.dt

res.1 <- FS.reduct.computation(decision.table)
print(res.1)



