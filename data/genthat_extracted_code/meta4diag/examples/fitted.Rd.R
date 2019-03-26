library(meta4diag)


### Name: fitted
### Title: Get the estimated values of accuracies for each study.
### Aliases: fitted fitted.meta4diag

### ** Examples

## Not run: 
##D if(requireNamespace("INLA", quietly = TRUE)){
##D   require("INLA", quietly = TRUE)
##D   data(Catheter)
##D   res <- meta4diag(data = Catheter, nsample=2000)
##D   fitted(res, accuracy.type="sens")
##D   fitted(res, accuracy.type="DOR")
##D }
## End(Not run)



