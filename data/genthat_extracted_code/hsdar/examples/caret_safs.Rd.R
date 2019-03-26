library(hsdar)


### Name: caret::safs
### Title: Methods for Function 'safs'
### Aliases: safs-methods get_safs safs,Speclib-method safs,Nri-method
###   safs,Specfeat-method
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
##D ## Supervised feature selection using simulated annealing
##D ## Note that this may take some time!
##D safs_res <- safs(spectral_data)
##D 
##D get_safs(safs_res)
##D 
##D plot(get_safs(safs_res))
## End(Not run)



