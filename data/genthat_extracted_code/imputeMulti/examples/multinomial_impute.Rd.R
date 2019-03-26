library(imputeMulti)


### Name: multinomial_impute
### Title: Impute Values for missing multinomial values
### Aliases: multinomial_impute

### ** Examples

## Not run: 
##D  data(tract2221)
##D  imputeEM <- multinomial_impute(tract2221[,1:4], method= "EM",
##D                    conj_prior = "none", verbose= TRUE)
##D  imputeDA <- multinomial_impute(tract2221[,1:4], method= "DA",
##D                    conj_prior = "non.informative", verbose= TRUE)
## End(Not run)




