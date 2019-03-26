library(GeNetIt)


### Name: knn.graph
### Title: Saturated or K Nearest Neighbour Graph
### Aliases: knn.graph

### ** Examples

 library(sp) 
   data(ralu.site)

 # Saturated spatial graph
 sat.graph <- knn.graph(ralu.site, row.names=ralu.site@data[,"SiteName"])
  head(sat.graph@data)
 
 # Distanced constrained spatial graph
 dist.graph <- knn.graph(ralu.site, row.names=ralu.site@data[,"SiteName"], max.dist = 5000)

 par(mfrow=c(1,2))	
plot(sat.graph, col="grey")
  points(ralu.site, col="red", pch=20, cex=1.5)
     box()
     title("Saturated graph")	
plot(dist.graph, col="grey")
  points(ralu.site, col="red", pch=20, cex=1.5)
     box()
     title("Distance constrained graph")	  
	



