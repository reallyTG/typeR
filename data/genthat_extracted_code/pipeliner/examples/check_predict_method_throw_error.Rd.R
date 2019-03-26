library(pipeliner)


### Name: check_predict_method_throw_error
### Title: Validate estimate_model method returns an object with a
###   'predict' method defined
### Aliases: check_predict_method_throw_error

### ** Examples

## Not run: 
##D estimation_method <- function(df) lm(eruptions ~ 0 + waiting, df)
##D data <- faithful
##D model_estimate <- estimation_method(data)
##D check_predict_method_throw_error(model_estimate)
##D # NULL
## End(Not run)



