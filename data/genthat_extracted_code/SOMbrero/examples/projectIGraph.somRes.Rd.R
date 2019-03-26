library(SOMbrero)


### Name: projectIGraph
### Title: Compute the projection of a graph on a grid
### Aliases: projectIGraph.somRes projectIGraph
### Keywords: methods

### ** Examples

data(lesmis)
set.seed(7383)
mis.som <- trainSOM(x.data=dissim.lesmis, type="relational", nb.save=10)
proj.lesmis <- projectIGraph(mis.som, lesmis)
## Not run: plot(proj.lesmis)



