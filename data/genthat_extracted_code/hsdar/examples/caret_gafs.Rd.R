library(hsdar)


### Name: caret::gafs
### Title: Methods for Function 'gafs'
### Aliases: gafs-methods get_gafs gafs,Speclib-method gafs,Nri-method
###   gafs,Specfeat-method
### Keywords: methods

### ** Examples

## Not run: 
##D data(spectral_data)
##D 
##D ## Set response variable (Chlorophyll content)
##D spectral_data <- setResponse(spectral_data, "chlorophyll")
##D 
##D ## Set additional predictor variables from the SI
##D spectral_data <- setPredictor(spectral_data, "season")
##D 
##D ## Feature selection using genetic algorithms
##D ## Note that this may take some time!
##D gafs_res <- gafs(spectral_data)
##D 
##D get_gafs(gafs_res)
## End(Not run)



