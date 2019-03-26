library(spikeslab)


### Name: sparsePC.spikeslab
### Title: Multiclass Prediction using Spike and Slab Regression
### Aliases: sparsePC.spikeslab sparsePC
### Keywords: regression

### ** Examples

## Not run: 
##D #------------------------------------------------------------
##D # Example 1:  leukemia data
##D #------------------------------------------------------------
##D 
##D data(leukemia, package = "spikeslab")
##D sparsePC.out <- sparsePC(x = leukemia[, -1], y = leukemia[, 1], n.rep = 3)
##D rf.obj <- sparsePC.out$rf.obj
##D varImpPlot(rf.obj)
## End(Not run)



