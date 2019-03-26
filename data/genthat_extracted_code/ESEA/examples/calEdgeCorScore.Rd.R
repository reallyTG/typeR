library(ESEA)


### Name: calEdgeCorScore
### Title: Calculate the differential correlation score for edges
### Aliases: calEdgeCorScore
### Keywords: file

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
##D #Calculate the differential correlation score for edges
##D EdgeCorScore<-calEdgeCorScore(dataset, class.labels, controlcharactor, edgesbackgrand)
##D 
##D #print the top ten results to screen
##D EdgeCorScore[1:10]
##D 
##D #Each element is the differential correlation score of an edge and whose name correspond to
##D # the edge in the background set of edges.
##D 
## End(Not run)



