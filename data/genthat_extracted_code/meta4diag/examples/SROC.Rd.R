library(meta4diag)


### Name: SROC
### Title: A standard summary receiver operating chracteristic plot.
### Aliases: SROC SROC.meta4diag

### ** Examples

## Not run: 
##D if(requireNamespace("INLA", quietly = TRUE)){
##D   require("INLA", quietly = TRUE)
##D   data(Catheter)
##D   res <- meta4diag(data = Catheter)
##D   SROC(res, est.type="mean")
##D }
## End(Not run)



