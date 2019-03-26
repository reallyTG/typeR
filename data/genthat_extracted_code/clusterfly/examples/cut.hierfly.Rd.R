library(clusterfly)


### Name: cut.hierfly
### Title: Cut hierfly object into k clusters/colours.
### Aliases: cut.hierfly
### Keywords: cluster

### ** Examples

h <- hierfly(iris)
hfly <- ggobi(h)
cut(h, 2, hfly)
h <- hierfly(iris, method="ward")
g <- ggobi(h)
cut(h, 2, g)



