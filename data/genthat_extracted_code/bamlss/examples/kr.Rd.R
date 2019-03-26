library(bamlss)


### Name: smooth.construct.kr.smooth.spec
### Title: Kriging Smooth Constructor
### Aliases: smooth.construct.kr.smooth.spec Predict.matrix.kriging.smooth
### Keywords: regression

### ** Examples

## Not run: 
##D ## Simulate data.
##D set.seed(123)
##D d <- GAMart()
##D 
##D ## Estimate model.
##D f <- num ~ s(x1,bs="kr") + s(x2,bs="kr") + s(x3,bs="kr") + s(lon,lat,bs="kr",k=30)
##D 
##D ## Set the seed, estimate model.
##D set.seed(111)
##D b <- bamlss(f, data = d)
##D 
##D ## Plot estimated effects.
##D plot(b)
## End(Not run)



