library(hsdar)


### Name: caret::sbf
### Title: Methods for Function 'sbf'
### Aliases: sbf-methods get_sbf sbf,Speclib-method sbf,Nri-method
###   sbf,Specfeat-method
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
##D ## Selection by filtering
##D ## Note that this may take some time!
##D sbf_res <- sbf(spectral_data)
##D 
##D get_sbf(sbf_res)
##D 
##D plot(get_sbf(sbf_res))
## End(Not run)



