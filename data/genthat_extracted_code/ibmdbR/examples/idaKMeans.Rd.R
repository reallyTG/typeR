library(ibmdbR)


### Name: idaKMeans
### Title: k-means clustering
### Aliases: idaKMeans print.idaKMeans predict.idaKMeans

### ** Examples
## Not run: 
##D 
##D #Create ida data frame
##D idf <- ida.data.frame("IRIS")
##D 
##D #Create a kmeans model stored in the database as KMEANSMODEL
##D km <- idaKMeans(idf, id="ID",modelname="KMEANSMODEL") 
##D 	
##D #Print the model
##D print(km)
##D 
##D #Predict the model
##D pred <- predict(km,idf,id="ID")
##D 
##D #Inspect the predictions
##D head(pred)
##D 	
## End(Not run)


