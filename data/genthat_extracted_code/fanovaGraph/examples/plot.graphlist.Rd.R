library(fanovaGraph)


### Name: plot.graphlist
### Title: Plot Graph via Package 'igraph'
### Aliases: plot.graphlist plot

### ** Examples

op <- par(no.readonly=TRUE)
g1 <- estimateGraph(f.mat=ishigami.fun, d=3, q.arg=list(min=-pi,max=pi), n.tot=10000)
plot(g1)
plot(g1, names=c("A","B","C"))
plot(g1, names=c("A","B","C"), plot.i1 = FALSE)

# include pure second order indices
g2 <- estimateGraph(f.mat=function(x) x[,1]*x[,2]*x[,3]+x[,2]*x[,3], d=3, 
  q.arg=list(min=-1,max=1), n.tot=10000)

plot(g2)
plot(g2, i2 = c(0.001, 0.001, 0.05))

# equal layouts and different edge thicknesses and circle diameters
g3 <- estimateGraph(f.mat=function(x) x[,1]*x[,2]*x[,3]*x[,4]*x[,5], d=5, 
  q.arg=list(min=-1,max=1), n.tot=10000)

g4 <- estimateGraph(f.mat=function(x) x[,1]*x[,2]*x[,3]+x[,4]*x[,5], d=5, 
  q.arg=list(min=-1,max=1), n.tot=10000)

graphClassIgraph <- graph.full(n = 5, directed = FALSE)
layout <- layout.circle(graphClassIgraph)

plot(g3, max.thickness= 10, circle.diameter= 30, layout=layout)
plot(g4, max.thickness= 30, circle.diameter= 50, layout=layout)



