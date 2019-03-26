library(BVS)


### Name: sampleBVS
### Title: Sampling Algorithm for Bayesian Variant Selection Methods
### Aliases: sampleBVS
### Keywords: model search

### ** Examples

## Rare Variant BRI example  
  ## Load the data for Rare variant example
  data(RareData)

  ## Run algorithm for 100 iterations for rare variant example.
  ## NOTE: Results from a more realistic run with 100K
  ## iterations can be found in data(RareBVS.out).
  RareBVS.out <- sampleBVS(data=RareData,iter=100,rare=TRUE)

  ## Run algorithm for 100 iterations for multiple region rare 
  ## variant example.
  p = dim(RareData)[2]-1
  regions = c(rep("Region1",(p/2)),rep("Region2",(p/2)))
  RareBVS.out <- sampleBVS(data=RareData,iter=100,rare=TRUE,mult.regions=TRUE,regions=regions)

## Informative iBMU Example
  ##Load the data for the informative example
  data(InformData)

  ## Run algorithm for 100 iterations for informative data example.
  ## This run is the basic Bayes model uncertainty algorithm with inform=FALSE 
  ## NOTE: Results from a more realistic run with 100K
  ## iterations can be found in data(InformBVS.NI.out).
  InformBVS.NI.out = sampleBVS(InformData$data,inform=FALSE,iter=100)

  ## Run algorithm for 100 iterations for informative data example.
  ## This run corresponds to the iBMU algorithm with inform=TRUE 
  ## and dichotomous predictor-level covariates indicating the gene of each variant.  
  ## NOTE: Results from a more realistic run with 100K
  ## iterations can be found in data(InformBVS.I.out).
  InformBVS.I.out = sampleBVS(InformData$data,inform=TRUE,
                              cov=as.matrix(InformData$cov),iter=100)



