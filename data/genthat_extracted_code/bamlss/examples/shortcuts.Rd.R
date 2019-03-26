library(bamlss)


### Name: boost2
### Title: Some Shortcuts
### Aliases: boost2 lasso2 bayesx2
### Keywords: regression

### ** Examples

## Not run: 
##D ## Simulate data.
##D set.seed(123)
##D d <- GAMart()
##D 
##D ## Estimate model.
##D f <- num ~ s(x1) + s(x2) + s(x3) + s(lon,lat)
##D 
##D ## Boosted model.
##D b <- boost2(f, data = d)
##D 
##D ## Plot estimated effects.
##D plot(b)
## End(Not run)



