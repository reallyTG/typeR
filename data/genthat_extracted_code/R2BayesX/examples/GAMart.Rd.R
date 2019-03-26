library(R2BayesX)


### Name: GAMart
### Title: GAM Artificial Data Set
### Aliases: GAMart gamart
### Keywords: datasets

### ** Examples

## Not run: 
##D data("GAMart")
##D 
##D ## normal response
##D b <- bayesx(num ~ fac + sx(x1) + sx(x2) + sx(x3) +
##D   sx(long, lat, bs = "te") + sx(id, bs = "re"),
##D   data = GAMart)
##D summary(b)
##D plot(b)
##D 
##D ## binomial response
##D b <- bayesx(bin ~ fac + sx(x1) + sx(x2) + sx(x3) +
##D   sx(long, lat, bs = "te") + sx(id, bs = "re"),
##D   data = GAMart, family = "binomial", method = "REML")
##D summary(b)
##D plot(b)
##D 
##D ## categorical response
##D b <- bayesx(cat ~ fac + sx(x1) + sx(x2) + sx(x3) +
##D   sx(long, lat, bs = "te") + sx(id, bs = "re"),
##D   data = GAMart, family = "cumprobit", method = "REML")
##D summary(b)
##D plot(b)
## End(Not run)



