library(ESEA)


### Name: PlotRunEnrichment
### Title: Plot running Edge enrichment score
### Aliases: PlotRunEnrichment

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
##D PathwayResult<-Results[[2]][1]
##D 
##D #Plot running edge enrichment score for the pathway result
##D PlotRunEnrichment(EdgeCorScore,PathwayResult,weighted.score.type = 1)
##D 
## End(Not run)



