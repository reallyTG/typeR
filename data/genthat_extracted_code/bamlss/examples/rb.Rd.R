library(bamlss)


### Name: rb
### Title: Random Bits for BAMLSS
### Aliases: rb smooth.construct.randombits.smooth.spec
### Keywords: regression

### ** Examples

## Not run: 
##D ## Simulate data.
##D set.seed(123)
##D d <- GAMart()
##D 
##D ## Estimate model.
##D f <- num ~ rb(x1) + rb(x2) + rb(x3) + rb(~lon+lat)
##D 
##D b <- bamlss(f, data = d)
##D 
##D plot(b)
## End(Not run)



