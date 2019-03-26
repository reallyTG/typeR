library(bamlss)


### Name: results.bamlss.default
### Title: Compute BAMLSS Results for Plotting and Summaries
### Aliases: results.bamlss.default
### Keywords: dplot

### ** Examples

## Not run: 
##D ## Simulate data.
##D d <- GAMart()
##D 
##D ## Estimate model with no results.
##D b <- bamlss(num ~ s(x1) + s(x2) + s(x3),
##D   data = d, results = FALSE)
##D 
##D ## Compute model results
##D a <- results.bamlss.default(b)
##D 
##D ## Plot results for smooth terms.
##D plot(a)
## End(Not run)



