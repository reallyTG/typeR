library(phylobase)


### Name: treePlot-methods
### Title: Phylogeny plotting
### Aliases: treePlot-methods treePlot plot,ANY,ANY-method
###   plot,pdata,missing-method plot,phylo4,missing-method treePlot-method
###   treePlot,phylo4,phylo4d-method plot plot,phylo4,missing-method
###   plot,phylo4-method
### Keywords: methods

### ** Examples


## example of plotting two grid plots on the same page
library(grid)
data(geospiza)
geotree <- extractTree(geospiza)
grid.newpage()
pushViewport(viewport(layout=grid.layout(nrow=1, ncol=2), name="base"))
  pushViewport(viewport(layout.pos.col=1, name="plot1"))
    treePlot(geotree, newpage=FALSE)
  popViewport()

  pushViewport(viewport(layout.pos.col=2, name="plot2"))
    treePlot(geotree, newpage=FALSE, rot=180)
popViewport(2)



