library(bamlss)


### Name: smooth.construct.sr.smooth.spec
### Title: Random Effects P-Spline
### Aliases: smooth.construct.sr.smooth.spec
### Keywords: regression

### ** Examples

## Not run: 
##D ## Simulate data.
##D set.seed(123)
##D d <- GAMart()
##D 
##D ## Estimate model.
##D f <- num ~ x1 + x2 + x3 + s2(x1,bs="sr") + s2(x2,bs="sr") + s2(x3,bs="sr")
##D 
##D b <- bamlss(f, data = d, optimizer = boost, sampler = FALSE)
##D 
##D plot(b)
## End(Not run)



