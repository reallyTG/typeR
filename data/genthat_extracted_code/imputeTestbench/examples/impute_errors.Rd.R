library(imputeTestbench)


### Name: impute_errors
### Title: Function working as testbench for comparison of imputing models
### Aliases: impute_errors

### ** Examples

## Not run: 
##D # default options
##D aa <- impute_errors(dataIn = nottem)
##D aa
##D plot_errors(aa)
##D 
##D # change the simulation for missing obs
##D aa <- impute_errors(dataIn = nottem, smps = 'mar')
##D aa
##D plot_errors(aa)
##D 
##D # use one interpolation method, increase repetitions
##D aa <- impute_errors(dataIn = nottem, methods = 'na.interp', repetition = 100)
##D aa
##D plot_errors(aa)
##D 
##D # change the error metric
##D aa <- impute_errors(dataIn = nottem, errorParameter = 'mae')
##D aa
##D plot_errors(aa)
##D 
##D # passing addtional arguments to imputation methods
##D impute_errors(dataIn = nottem, addl_arg = list(na.mean = list(option = 'mode')))
## End(Not run)



