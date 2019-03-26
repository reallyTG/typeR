library(cluster)


### Name: plot.agnes
### Title: Plots of an Agglomerative Hierarchical Clustering
### Aliases: plot.agnes
### Keywords: cluster hplot

### ** Examples

## Can also pass `labels' to pltree() and bannerplot():
data(iris)
cS <- as.character(Sp <- iris$Species)
cS[Sp == "setosa"] <- "S"
cS[Sp == "versicolor"] <- "V"
cS[Sp == "virginica"] <- "g"
ai <- agnes(iris[, 1:4])
plot(ai, labels = cS, nmax = 150)# bannerplot labels are mess



