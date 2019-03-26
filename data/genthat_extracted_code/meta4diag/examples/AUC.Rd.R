library(meta4diag)


### Name: AUC
### Title: A function that calculate the area under summary receiver
###   operating chracteristic line.
### Aliases: AUC AUC.meta4diag

### ** Examples

## Not run: 
##D if(requireNamespace("INLA", quietly = TRUE)){
##D   require("INLA", quietly = TRUE)
##D   data(Catheter)
##D   res <- meta4diag(data = Catheter, nsample=1000)
##D   AUC(res, est.type="mean")
##D }
## End(Not run)



