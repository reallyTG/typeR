library(bamlss)


### Name: lin
### Title: Linear Effects for BAMLSS
### Aliases: lin smooth.construct.linear.smooth.spec
### Keywords: regression

### ** Examples

## Not run: 
##D ## Simulate data.
##D set.seed(123)
##D d <- GAMart()
##D 
##D ## Estimate model.
##D f <- num ~ lin(~x1+x2+x3+fac,ridge=TRUE)
##D 
##D b <- bamlss(f, data = d)
##D 
##D summary(b)
## End(Not run)



