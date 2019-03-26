library(tsna)


### Name: plotPaths
### Title: Network Plots a Highlighting Temporal Path(s) .
### Aliases: plotPaths plot.tPath

### ** Examples

data(moodyContactSim)
v10path<-tPath(moodyContactSim,v=10,start=0)
# plot just the path from v10
plot(v10path)

# plot the path from v10 on top of the network
plotPaths(moodyContactSim,v10path)

# plot the paths from both v10 and v1
v1path<-tPath(moodyContactSim,v=1,start=0)
plotPaths(moodyContactSim,list(v10path,v1path))

# if ndtv package is installed, along with Graphviz system library,
# nice hierarchical trees can be drawn
## Not run: 
##D plot(v10path,
##D      coord=network.layout.animate.Graphviz(
##D                    as.network(v10path),
##D                    layout.par = list(gv.engine='dot')
##D             ),
##D             jitter=FALSE
##D     )
## End(Not run)




