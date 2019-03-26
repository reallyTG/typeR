library(data.tree)


### Name: DefaultPlotHeight
### Title: Calculates the height of a 'Node' given the height of the root.
### Aliases: DefaultPlotHeight

### ** Examples

data(acme)
dacme <- as.dendrogram(acme, heightAttribute = function(x) DefaultPlotHeight(x, 200))
plot(dacme, center = TRUE)




