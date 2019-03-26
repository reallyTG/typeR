library(MixAll)


### Name: show,ClusterAlgo-method
### Title: Show description of a MixAll S4 class to standard output.
### Aliases: show,ClusterAlgo-method show show-algo,ClusterAlgo-method
###   show,ClusterAlgoPredict-method show
###   show-algo,ClusterAlgoPredict-method show,ClusterInit-method
###   show-init,ClusterInit,ClusterInit-method show,ClusterStrategy-method
###   show show-strategy,ClusterStrategy-method
###   show,IClusterComponent-method
###   show-IClusterComponent,IClusterComponent,IClusterComponent-method
###   show,IClusterModel-method show show
###   show,ClusterCategoricalComponent-method
###   show-ClusterCategoricalComponent,ClusterCategoricalComponent,ClusterCategoricalComponent-method
###   show,ClusterCategorical-method
###   show-ClusterCategorical,ClusterCategorical,ClusterCategorical-method
###   show,ClusterDiagGaussianComponent-method
###   show-ClusterDiagGaussianComponent,ClusterDiagGaussianComponent,ClusterDiagGaussianComponent-method
###   show,ClusterDiagGaussian-method
###   show-ClusterDiagGaussian,ClusterDiagGaussian,ClusterDiagGaussian-method
###   show,ClusterGammaComponent-method
###   show-ClusterGammaComponent,ClusterGammaComponent,ClusterGammaComponent-method
###   show,ClusterGamma-method
###   show-ClusterGamma,ClusterGamma,ClusterGamma-method
###   show,ClusterMixedDataModel-method
###   show-ClusterMixedDataModel,ClusterMixedDataModel,ClusterMixedDataModel-method
###   show,ClusterPoissonComponent-method
###   show-ClusterPoissonComponent,ClusterPoissonComponent,ClusterPoissonComponent-method
###   show,ClusterPoisson-method
###   show-ClusterPoisson,ClusterPoisson,ClusterPoisson-method
###   show,IClusterPredict-method show show,ClusterPredict-method show
###   show,ClusterPredictMixedData-method show show,LearnAlgo-method show
###   show-algo,LearnAlgo-method show,KmmComponent-method
###   show-KmmComponent,KmmComponent,KmmComponent-method
###   show,KmmModel-method show-KmmModel,KmmModel,KmmModel-method
###   show,KmmMixedDataModel-method
###   show-KmmMixedDataModel,KmmMixedDataModel,KmmMixedDataModel-method

### ** Examples

  ## for strategy
  strategy <- clusterStrategy()
  show(strategy)
  ## for cluster init
  init <- clusterInit()
  show(init)
  ## for cluster algo
  algo <- clusterAlgo()
  show(algo)




