library(bamlss)


### Name: samplestats
### Title: Sampling Statistics
### Aliases: samplestats
### Keywords: regression

### ** Examples

## Not run: 
##D ## Generate some data.
##D d <- GAMart()
##D 
##D ## Estimate model without sampling statistics
##D b <- bamlss(num ~ s(x1) + s(x2) + s(x3) + te(lon,lat),
##D   data = d, samplestats = FALSE)
##D 
##D ## Note: needs the $d() or $loglik() function in the family!
##D names(family(b))
##D 
##D ## Compute sampling statistics.
##D samplestats(b)
## End(Not run)



