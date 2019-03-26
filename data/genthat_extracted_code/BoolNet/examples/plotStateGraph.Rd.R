library(BoolNet)


### Name: plotStateGraph
### Title: Visualize state transitions and attractor basins
### Aliases: plotStateGraph
### Keywords: Boolean network attractor cycle basin transition state graph
###   plot

### ** Examples

# load example data
data(cellcycle)

# get attractors
attractors <- getAttractors(cellcycle)

# plot state graph
## Not run: 
##D plotStateGraph(attractors, main = "Cell cycle network", layout = layout.fruchterman.reingold)
## End(Not run)



