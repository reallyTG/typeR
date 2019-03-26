library(bamlss)


### Name: samples
### Title: Extract Samples
### Aliases: samples samples.bamlss samples.bamlss.frame
### Keywords: regression models

### ** Examples

## Not run: 
##D ## Generate data.
##D d <- GAMart()
##D 
##D ## Estimate model.
##D b <- bamlss(num ~ s(x1) + s(x2) + s(x3), data = d)
##D 
##D ## Extract samples for "s(x2)".
##D sa <- samples(b, term = "s(x2)")
##D head(sa)
##D 
##D ## Trace plot.
##D plot(sa)
## End(Not run)



