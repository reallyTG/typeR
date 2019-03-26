library(chemmodlab)


### Name: ModelTrain
### Title: Fit predictive models to sets of descriptors.
### Aliases: ModelTrain ModelTrain.data.frame ModelTrain.default

### ** Examples


## Not run: 
##D # A data set with  binary response and multiple descriptor sets
##D data(aid364)
##D 
##D cml <- ModelTrain(aid364, ids = TRUE, xcol.lengths = c(24, 147),
##D                   des.names = c("BurdenNumbers", "Pharmacophores"))
##D cml
## End(Not run)

# A continuous response
cml <- ModelTrain(USArrests, nsplits = 2, nfolds = 2,
                  models = c("KNN", "Lasso", "Tree"))
cml




