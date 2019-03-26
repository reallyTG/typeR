library(bamlss)


### Name: fitted.bamlss
### Title: BAMLSS Fitted Values
### Aliases: fitted.bamlss
### Keywords: regression models

### ** Examples

## Not run: 
##D ## Generate some data.
##D d <- GAMart()
##D 
##D ## Model formula.
##D f <- list(
##D   num ~ s(x1) + s(x2) + s(x3) + te(lon,lat),
##D   sigma ~ s(x1) + s(x2) + s(x3) + te(lon,lat)
##D )
##D 
##D ## Estimate model.
##D b <- bamlss(f, data = d)
##D 
##D ## Fitted values returned from optimizer.
##D f1 <- fitted(b, model = "mu", samples = FALSE)
##D 
##D ## Fitted values returned from sampler.
##D f2 <- fitted(b, model = "mu", samples = TRUE, FUN = mean)
##D 
##D plot(f1, f2)
## End(Not run)



