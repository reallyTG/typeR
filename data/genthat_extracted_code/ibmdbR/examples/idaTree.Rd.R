library(ibmdbR)


### Name: idaTree
### Title: Decision and Regression tree
### Aliases: idaTree plot.idaTree predict.idaTree

### ** Examples
## Not run: 
##D 
##D #Create a pointer to the table IRIS
##D idf <- ida.data.frame('IRIS')
##D 
##D #Create a tree model
##D tr <- idaTree(Species~.,idf,"ID",modelname="MYTREEMODEL")
##D 
##D #Print the model
##D print(tr)
##D 
##D #Plot the model
##D plot(tr)
##D 
##D #Apply the model to data
##D pred <- predict(tr,idf,id="ID")
##D 
##D #Inspect the predictions
##D head(pred)
##D 
## End(Not run)




