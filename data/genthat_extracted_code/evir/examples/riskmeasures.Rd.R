library(evir)


### Name: riskmeasures
### Title: Calculates Quantiles and Expected Shortfalls
### Aliases: riskmeasures
### Keywords: htest

### ** Examples

data(danish)
out <- gpd(danish, 10) 
riskmeasures(out, c(0.999, 0.9999)) 
# gives estimates of 0.999 and 0.9999 quantiles of Danish loss
# distribution as well as the associated expected shortfall estimates 



