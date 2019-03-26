library(ESEA)


### Name: PlotPathwayGraph
### Title: Plot the pathway-result network diagram
### Aliases: PlotPathwayGraph

### ** Examples

## Not run: 
##D 
##D #get example data
##D dataset<-GetExampleData("dataset")
##D class.labels<-GetExampleData("class.labels")
##D controlcharactor<-GetExampleData("controlcharactor")
##D 
##D #get the data for background set of edges
##D edgesbackgrand<-GetEdgesBackgrandData()
##D 
##D #get the edge sets of pathways
##D pathwayEdge.db<-GetPathwayEdgeData()
##D 
##D #calculate the differential correlation score for edges
##D EdgeCorScore<-calEdgeCorScore(dataset, class.labels, controlcharactor,edgesbackgrand)
##D 
##D #identify dysregulated pathways by using the function ESEA.Main
##D #Results<-ESEA.Main(EdgeCorScore,pathwayEdge.db)
##D Results<-GetExampleData("PathwayResult")
##D 
##D #obtain the detail results of genes for a significant pathway
##D PathwayNetwork<-Results[[2]][[1]]
##D 
##D #Plot the pathway-result network diagram, the edges which contribute to the ES are labeled with red.
##D PlotPathwayGraph(PathwayNetwork,layout=layout.random)
##D 
## End(Not run)



