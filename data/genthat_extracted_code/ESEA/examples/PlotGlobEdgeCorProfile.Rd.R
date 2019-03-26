library(ESEA)


### Name: PlotGlobEdgeCorProfile
### Title: Plot global edge correlation profile
### Aliases: PlotGlobEdgeCorProfile

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
##D #calculate the differential correlation score for edges
##D EdgeCorScore<-calEdgeCorScore(dataset, class.labels, controlcharactor, edgesbackgrand)
##D 
##D #plot global edge correlation profile
##D PlotGlobEdgeCorProfile(EdgeCorScore)
##D 
## End(Not run)



