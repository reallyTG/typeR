library(ESEA)


### Name: ESEA.Main
### Title: Identify dysregulated pathways based on edge set enrichment
###   analysis
### Aliases: ESEA.Main

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
##D EdgeCorScore<-calEdgeCorScore(dataset, class.labels, controlcharactor, edgesbackgrand)
##D 
##D #identify dysregulated pathways by using the function ESEA.Main
##D Results<-ESEA.Main(
##D EdgeCorScore,
##D pathwayEdge.db,
##D weighted.score.type = 1, 
##D pathway = "kegg", 
##D gs.size.threshold.min = 15, 
##D gs.size.threshold.max = 1000,
##D reshuffling.type = "edge.labels",
##D nperm =10, 
##D p.val.threshold=-1,
##D FDR.threshold = 0.05, 
##D topgs =1
##D )
##D 
##D #print the summary results of pathways to screen
##D Results[[1]][[1]][1:5,]
##D 
##D #print the detail results of pathways to screen
##D Results[[2]][[1]][1:5,]
##D 
##D #write the summary results of pathways to tab delimited file.
##D write.table(Results[[1]][[1]], file = "kegg-SUMMARY RESULTS Gain-of-correlation.txt", quote=F,
##D  row.names=F, sep = "\t")
##D write.table(Results[[1]][[2]], file = "kegg-SUMMARY RESULTS Loss-of-correlation.txt", quote=F,
##D  row.names=F, sep = "\t")
##D 
##D #write the detail results of genes for each pathway with FDR.threshold< 0.05 to tab delimited file.
##D for(i in 1:length(Results[[2]])){
##D PathwayList<-Results[[2]][[i]]
##D filename <- paste(names(Results[[2]][i]),".txt", sep="", collapse="")
##D write.table(PathwayList, file = filename, quote=F, row.names=F, sep = "\t")
##D }
##D 
## End(Not run)



