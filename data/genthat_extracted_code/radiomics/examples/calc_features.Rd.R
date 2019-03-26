library(radiomics)


### Name: calc_features
### Title: Calculate texture and first order statistics.
### Aliases: calc_features calc_features,matrix-method
###   calc_features,glcm-method calc_features,glrlm-method
###   calc_features,glszm-method calc_features,mglszm-method

### ** Examples

## Not run: 
##D calc_features(glcm(hallbey))
##D calc_features(glrlm(psf, n_grey=10))
##D calc_features(glcm(hallbey), features=c("glcm_mean", "glcm_variance", "pickles"))
## End(Not run)




