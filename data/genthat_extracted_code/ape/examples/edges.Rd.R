library(ape)


### Name: edges
### Title: Draw Additional Edges on a Plotted Tree
### Aliases: edges fancyarrows
### Keywords: aplot

### ** Examples

set.seed(2)
tr <- rcoal(6)
plot(tr, "c")
edges(10, 9, col = "red", lty = 2)
edges(10:11, 8, col = c("blue", "green")) # recycling of 'nodes1'
edges(1, 2, lwd = 2, type = "h", arrows = 3, col = "green")
nodelabels()



