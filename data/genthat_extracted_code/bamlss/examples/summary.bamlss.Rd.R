library(bamlss)


### Name: summary.bamlss
### Title: Summary for BAMLSS
### Aliases: summary.bamlss print.summary.bamlss
### Keywords: models regression

### ** Examples

## Not run: 
##D ## Generate some data.
##D d <- GAMart()
##D 
##D ## Model formula.
##D f <- list(
##D   num ~ s(x1) + s(x2),
##D   sigma ~ s(x3) + te(lon,lat)
##D )
##D 
##D ## Estimate model.
##D b <- bamlss(f, data = d)
##D 
##D ## Print the summary.
##D print(summary(b))
## End(Not run)



