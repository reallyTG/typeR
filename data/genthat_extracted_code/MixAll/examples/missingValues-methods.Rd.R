library(MixAll)


### Name: missingValues
### Title: Return the missing values of a component or a cluster class.
### Aliases: missingValues missingValues,ClusterMixedDataModel-method
###   missingValues,ClusterDiagGaussian-method
###   missingValues,ClusterDiagGaussianComponent-method
###   missingValues,ClusterDiagGaussian-method
###   missingValues,ClusterGammaComponent-method
###   missingValues,ClusterGamma-method
###   missingValues,ClusterCategoricalComponent-method
###   missingValues,ClusterCategorical-method
###   missingValues,ClusterPoissonComponent-method
###   missingValues,ClusterPoisson-method
###   missingValues,ClusterPredict-method
###   missingValues,ClusterPredictMixedData-method
###   missingValues,KmmComponent-method missingValues,KmmModel-method

### ** Examples

## Not run: 
##D ## add 10 missing values as random
##D data(geyser)
##D x = as.matrix(geyser); n <- nrow(x); p <- ncol(x);
##D indexes <- matrix(c(round(runif(5,1,n)), round(runif(5,1,p))), ncol=2);
##D x[indexes] <- NA;
##D ## estimate model (using fast strategy, results may be misleading)
##D model <- clusterDiagGaussian(data=x, nbCluster=2:3, strategy = clusterFastStrategy())
##D missingValues(model)
## End(Not run)




