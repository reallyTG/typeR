library(geoR)


### Name: hoef
### Title: Data for spatial analysis of experiments
### Aliases: hoef
### Keywords: datasets

### ** Examples

hoef.geo <- as.geodata(hoef, covar.col=4)
summary(hoef)
summary(hoef.geo)
points(hoef.geo, cex.min=2, cex.max=2, pt.div="quintiles")



