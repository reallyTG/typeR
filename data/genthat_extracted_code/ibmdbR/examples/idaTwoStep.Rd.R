library(ibmdbR)


### Name: idaTwoStep
### Title: two step clustering
### Aliases: idaTwoStep print.idaTwoStep predict.idaTwoStep

### ** Examples
## Not run: 
##D 
##D #Create ida data frame
##D idf <- ida.data.frame("IRIS")
##D 
##D #Create a TwoStep model stored in the database as TwoStepMODEL
##D tsm <- idaTwoStep(idf, id="ID",modelname="TwoStepMODEL") 
##D 	
##D #Print the model
##D print(tsm)
##D 
##D #Predict the model
##D pred <- predict(tsm,idf,id="ID")
##D 
##D #Inspect the predictions
##D head(pred)
##D 	
## End(Not run)


