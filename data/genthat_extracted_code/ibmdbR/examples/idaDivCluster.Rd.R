library(ibmdbR)


### Name: idaDivCluster
### Title: Hierarchical (divisive) clustering
### Aliases: idaDivCluster print.idaDivCluster predict.idaDivCluster

### ** Examples
## Not run: 
##D 
##D #Create ida data frame
##D idf <- ida.data.frame("IRIS")
##D 
##D #Create a DivCluster model stored in the database as DivClusterMODEL
##D dcm <- idaDivCluster(idf, id="ID",modelname="DivClusterMODEL") 
##D 	
##D #Print the model
##D print(dcm)
##D 
##D #Predict the model
##D pred <- predict(dcm,idf,id="ID")
##D 
##D #Inspect the predictions
##D head(pred)
##D 	
## End(Not run)


