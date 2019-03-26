library(compositions)


### Name: dist
### Title: Distances in variouse approaches
### Aliases: dist dist.default
### Keywords: multivariate

### ** Examples

data(SimulatedAmounts)
phc <- function(d) { plot(hclust(d))}
phc(dist(iris[,1:4]))
phc(dist(acomp(sa.lognormals),method="manhattan"))
phc(dist(rcomp(sa.lognormals)))
phc(dist(aplus(sa.lognormals)))
phc(dist(rplus(sa.lognormals)))




