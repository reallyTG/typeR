library(bamlss)


### Name: parameters
### Title: Extract or Initialize Parameters for BAMLSS
### Aliases: parameters
### Keywords: regression

### ** Examples

## Create a "bamlss.frame"
set.seed(123)
d <- GAMart()
bf <- bamlss.frame(num ~ s(x1) + te(lon,lat), data = d)

## Create list of all parameters from "bamlss.frame".
p <- parameters(bf, list = TRUE)
str(p)

## Not run: 
##D ## Estimate model.
##D f <- list(num ~ s(x1) + te(lon,lat), sigma ~ s(x1))
##D b <- bamlss(f, data = d, sampler = FALSE)
##D 
##D ## Extract estimated parameters.
##D parameters(b)
##D parameters(b, list = TRUE)
## End(Not run)



