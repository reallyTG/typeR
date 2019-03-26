library(TideHarmonics)


### Name: nodal_adj
### Title: Calculate nodal corrections.
### Aliases: nodal_adj
### Keywords: manip

### ** Examples

days <- seq(as.Date("2012-12-30"), as.Date("2013-01-08"), 1)
lamb <- lambdas(days)
nodal_adj(lamb[3,], lamb[4,], lamb[5,])



