library(mi)


### Name: fit_model
### Title: Wrappers To Fit a Model
### Aliases: fit_model fit_model-methods
### Keywords: regression DirectedTowardDevelopeRs

### ** Examples

getMethod("fit_model", signature(y = "binary", data = "missing_data.frame"))
setMethod("fit_model", signature(y = "binary", data = "missing_data.frame"), def =
function(y, data, ...) {
  to_drop <- data@index[[y@variable_name]]
  X <- data@X[, -to_drop]
  start <- NULL
  # using glm.fit() instead of bayesglm.fit()
  out <- glm.fit(X, y@data, weights = data@weights[[y@variable_name]], start = start, 
                 family = y@family, Warning = FALSE, ...)
  out$x <- X
  class(out) <- c("glm", "lm") # not "bayesglm" class anymore
  return(out)
})
## Not run: 
##D if(!exists("imputations", env = .GlobalEnv)) {
##D   imputations <- mi:::imputations # cached from example("mi-package")
##D }
##D imputations <- mi(imputations) # will use new fit_model() method for binary variables
## End(Not run)



