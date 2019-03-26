library(vegan)


### Name: monoMDS
### Title: Global and Local Non-metric Multidimensional Scaling and Linear
###   and Hybrid Scaling
### Aliases: monoMDS scores.monoMDS plot.monoMDS points.monoMDS
###   text.monoMDS
### Keywords: multivariate

### ** Examples

data(dune)
dis <- vegdist(dune)
m <- monoMDS(dis, model = "loc")
m
plot(m)



