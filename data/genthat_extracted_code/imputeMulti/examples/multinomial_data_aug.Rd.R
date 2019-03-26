library(imputeMulti)


### Name: multinomial_data_aug
### Title: Data Augmentation algorithm for multinomial data
### Aliases: multinomial_data_aug

### ** Examples

## Not run: 
##D  data(tract2221)
##D  x_y <- multinomial_stats(tract2221[,1:4], output= "x_y")
##D  z_Os_y <- multinomial_stats(tract2221[,1:4], output= "z_Os_y")
##D  x_possible <- multinomial_stats(tract2221[,1:4], output= "possible.obs")
##D 
##D  imputeDA_mle <- multinomial_data_aug(x_y, z_Os_y, x_possible, n_obs= nrow(tract2221),
##D                      conj_prior= "none", verbose= TRUE)
## End(Not run)




