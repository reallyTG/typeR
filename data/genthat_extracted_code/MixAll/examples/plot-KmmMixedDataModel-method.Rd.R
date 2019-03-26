library(MixAll)


### Name: plot,KmmMixedDataModel-method
### Title: Plotting of a class ['KmmMixedDataModel']
### Aliases: plot,KmmMixedDataModel-method plot-KmmMixedDataModel

### ** Examples

## Not run: 
##D data(bullsEye)
##D data(bullsEye.cat)
##D ## with default values
##D ldata  = list(bullsEye, bullsEye.cat)
##D modelcont <- list(modelName="kmm_pk_s", dim = 10, kernelName="Gaussian")
##D modelcat  <- list(modelName="kmm_pk_s", dim = 20, kernelName="Hamming", kernelParameters = c(0.6))
##D lmodels = list( modelcont, modelcat)
##D 
##D model <- kmmMixedData(ldata, lmodels, nbCluster=2:5, strategy = clusterFastStrategy())
##D # plot only the first continuous data set
##D plot(model, y=c(1))
##D   
## End(Not run)




