library(cluster)


### Name: plot.diana
### Title: Plots of a Divisive Hierarchical Clustering
### Aliases: plot.diana
### Keywords: cluster hplot

### ** Examples

example(diana)# -> dv <- diana(....)

plot(dv, which = 1, nmax.lab = 100)

## wider labels :
op <- par(mar = par("mar") + c(0, 2, 0,0))
plot(dv, which = 1, nmax.lab = 100, max.strlen = 12)
par(op)



