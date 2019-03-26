library(hsdar)


### Name: caret::rfe
### Title: Methods for Function 'rfe'
### Aliases: rfe-methods get_rfe rfe,Speclib-method rfe,Nri-method
###   rfe,Specfeat-method
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
##D ## Recursive feature selection
##D ## Note that this may take some time!
##D rfe_res <- rfe(spectral_data)
##D 
##D get_rfe(rfe_res)
##D 
##D plot(get_rfe(rfe_res))
## End(Not run)



