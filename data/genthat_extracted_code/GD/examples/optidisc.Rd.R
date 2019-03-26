library(GD)


### Name: optidisc
### Title: Optimal discretization for continuous variables and
###   visualization.
### Aliases: optidisc print.optidisc plot.optidisc

### ** Examples

## set optional discretization methods and numbers of intervals
# optional methods: equal, natural, quantile, geometric, sd and manual
discmethod <- c("equal","natural","quantile","geometric","sd")
discitv <- c(3:7)
## optimal discretization
odc1 <- optidisc(ndvi_40$Tempchange, ndvi_40$NDVIchange, discmethod, discitv)
odc1
plot(odc1)




