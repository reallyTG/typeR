library(gear)


### Name: cmod.man
### Title: Standard covariance models for geostatistical data.
### Aliases: cmod.man

### ** Examples

coords = matrix(runif(20), ncol = 2)
d = as.matrix(dist(coords))
cmod.man(v = exp(-d), evar = 1) 



