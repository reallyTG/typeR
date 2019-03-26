library(disto)


### Name: plot.disto
### Title: Plot a disto object
### Aliases: plot.disto

### ** Examples

temp <- stats::dist(iris[,1:4])
dio  <- disto(objectname = "temp")
plot(dio, type = "heatmap")
plot(dio, type = "dendrogram")



