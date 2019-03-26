library(phylobase)


### Name: plotOneTree
### Title: Plot a phylo4 object
### Aliases: plotOneTree
### Keywords: methods

### ** Examples

library(grid)
data(geospiza)
grid.newpage()
xxyy <- phyloXXYY(geospiza)
plotOneTree(xxyy, type = 'phylogram',
  show.tip.label = TRUE, show.node.label = TRUE,
  edge.color = 'black', node.color = 'orange', tip.color = 'blue',
  edge.width = 1, rot = 0
)

grid.newpage()
pushViewport(viewport(w = 0.8, h = 0.8))
plotOneTree(xxyy, type = 'phylogram',
  show.tip.label = TRUE, show.node.label = TRUE,
  edge.color = 'black', node.color = 'orange', tip.color = 'blue',
  edge.width = 1, rot = 0
)
popViewport()




