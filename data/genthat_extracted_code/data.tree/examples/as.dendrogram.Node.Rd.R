library(data.tree)


### Name: as.dendrogram.Node
### Title: Convert a 'Node' to a 'dendrogram'
### Aliases: as.dendrogram.Node

### ** Examples

data(acme)
acmed <- as.dendrogram(acme)
plot(acmed, center = TRUE)

#you can take an attribute for the height:
acme$Do( function(x) x$myPlotHeight <- (10 - x$level))
acmed <- as.dendrogram(acme, heightAttribute = "myPlotHeight")
plot(acmed, center = TRUE)

#or directly a function
acmed <- as.dendrogram(acme, heightAttribute = function(x) 10 - x$level)
plot(acmed)




