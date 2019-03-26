library(openVA)


### Name: getCSMF
### Title: Obtain CSMF from fitted model
### Aliases: getCSMF

### ** Examples

## Not run: 
##D library(InSilicoVA)
##D data(RandomVA1)
##D # for illustration, only use interVA on 100 deaths
##D fit <- codeVA(RandomVA1[1:100, ], data.type = "WHO2012", model = "InterVA", 
##D                   version = "4.03", HIV = "h", Malaria = "l")
##D getCSMF(fit)
##D library(InterVA5)
##D data(RandomVA5)
##D fit <- codeVA(RandomVA5[1:100, ], data.type = "WHO2016", model = "InterVA", 
##D                   version = "5.0", HIV = "h", Malaria = "l")
##D getCSMF(fit)
## End(Not run)




