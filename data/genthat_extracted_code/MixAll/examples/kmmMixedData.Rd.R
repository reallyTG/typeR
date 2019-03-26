library(MixAll)


### Name: kmmMixedData
### Title: Create an instance of the ['KmmMixedDataModel'] class
### Aliases: kmmMixedData

### ** Examples


## An example with the bullsEye data set
data(bullsEye)
data(bullsEye.cat)
## with default values
ldata  = list(bullsEye, bullsEye.cat)
modelcont <- list(modelName="kmm_pk_s", dim = 10, kernelName="Gaussian")
modelcat  <- list(modelName="kmm_pk_s", dim = 20, kernelName="Hamming", kernelParameters = c(0.6))
lmodels = list( modelcont, modelcat)

model <- kmmMixedData(ldata, lmodels, nbCluster=2:5, strategy = clusterFastStrategy())

## get summary
summary(model)


## Not run: 
##D ## use graphics functions
##D plot(model)
## End(Not run)




