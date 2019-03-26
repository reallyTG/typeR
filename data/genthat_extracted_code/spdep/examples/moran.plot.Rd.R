library(spdep)


### Name: moran.plot
### Title: Moran scatterplot
### Aliases: moran.plot
### Keywords: spatial

### ** Examples

data(afcon, package="spData")
moran.plot(afcon$totcon, nb2listw(paper.nb),
 labels=as.character(afcon$name), pch=19)
moran.plot(as.vector(scale(afcon$totcon)), nb2listw(paper.nb),
 labels=as.character(afcon$name), xlim=c(-2, 4), ylim=c(-2,4), pch=19)



