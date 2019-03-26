library(dynamicGraph)


### Name: dg.simple.graph-class
### Title: Class dg.simple.graph
### Aliases: dg.simple.graph-class dg,dg.simple.graph-method
###   coerce,dg.simple.graph,dg.graph-method
###   addModel,dg.simple.graph-method addView,dg.simple.graph-method
###   replaceModel,dg.simple.graph-method
###   replaceView,dg.simple.graph-method
### Keywords: classes

### ** Examples

x <- new("dg.simple.graph", vertex.names = c("a", "b"), 
         from = 1, to = 2) ; str(x)
dg(new("dg.simple.graph", vertex.names = c("a", "b"), 
       edge.list = list(c(1, 2))))



