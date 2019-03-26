library(rviewgraph)


### Name: rViewGraph
### Title: This is a function to create and start the Java graph animation
###   GUI.
### Aliases: rViewGraph rViewGraph.default rViewGraph.Matrix
###   rViewGraph.igraph
### Keywords: graph

### ** Examples

# 
# Viewing an Erdos Renyui random graph specified by random edges.
f = sample(100,size=200,replace=TRUE)
t = sample(100,size=200,replace=TRUE)
vft = rViewGraph(cbind(f,t))
#
# Edges can also be specified in \code{igraph} style.
e = c(t,f)
ve = rViewGraph(e)



