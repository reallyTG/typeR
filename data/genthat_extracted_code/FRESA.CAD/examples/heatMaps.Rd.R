library(FRESA.CAD)


### Name: heatMaps
### Title: Plot a heat map of selected variables
### Aliases: heatMaps
### Keywords: Data_Inspection

### ** Examples

	## Not run: 
##D 
##D 		library(rpart)
##D 		data(stagec)
##D 
##D 		# Set the options to keep the na
##D 		options(na.action='na.pass')
##D 		# create a model matrix with all the NA values imputed
##D 		stagecImputed <- as.data.frame(nearestNeighborImpute(model.matrix(~.,stagec)[,-1]))
##D 
##D 		# the simple heat map
##D 		hm <- heatMaps(Outcome="pgstat",data=stagecImputed,title="Heat Map",Scale=TRUE) 
##D 
##D 		# transposing the heat-map with clustered colums
##D 		hm <- heatMaps(Outcome="pgstat",data=stagecImputed,title="Heat Map",Scale=TRUE,
##D 					   transpose= TRUE,hCluster = TRUE,
##D 					   cexRow=0.80,cexCol=0.50,srtCol=35) 
##D 
##D 		# transposing the heat-map with reds and time to event as outcome
##D 		hm <- heatMaps(Outcome="pgtime",data=stagecImputed,title="Heat Map",Scale=TRUE,
##D 					   theFiveColors=c("black","red","orange","yellow","white"),
##D 					   cexRow=0.50,cexCol=0.80,srtCol=35) 
##D 	
## End(Not run)



