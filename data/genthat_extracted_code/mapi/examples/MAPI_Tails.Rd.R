library(mapi)


### Name: MAPI_Tails
### Title: Function MAPI_Tails
### Aliases: MAPI_Tails

### ** Examples

## Not run: 
##D data("metric")
##D data("samples")
##D # Run MAPI computation
##D resu <- MAPI_RunAuto(samples, metric, crs=3857, nbPermuts=1000)
##D # Discards the 10% cells with the smallest sum-of-weights 
##D #    and aggregates adjacent cells belonging to the same tail 
##D #    at a 5% significance level
##D tails <- MAPI_Tails(resu, minQ=10, alpha=0.05)
## End(Not run)




