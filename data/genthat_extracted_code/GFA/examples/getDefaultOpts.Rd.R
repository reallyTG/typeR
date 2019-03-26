library(GFA)


### Name: getDefaultOpts
### Title: A function for generating the default priors of GFA model
### Aliases: getDefaultOpts

### ** Examples

#Given pre-specified data collection Y and component number K
opts <- getDefaultOpts(bicluster=FALSE)
opts$normalLatents <- FALSE #Binary sparsity for each sample and data source
 ## Not run: model <- gfa(Y,opts,K)



