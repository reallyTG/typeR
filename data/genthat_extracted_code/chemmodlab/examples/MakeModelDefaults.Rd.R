library(chemmodlab)


### Name: MakeModelDefaults
### Title: Model parameters for ModelTrain
### Aliases: MakeModelDefaults

### ** Examples

params <- MakeModelDefaults(n = nrow(USArrests),
 p = ncol(USArrests[, -1]), classify = TRUE, nfolds = 10)
params$Forest$mtry <- ncol(USArrests[, -1])-1
params

cml <- ModelTrain(USArrests, models = "RF", nsplits = 3,
 user.params = params)





