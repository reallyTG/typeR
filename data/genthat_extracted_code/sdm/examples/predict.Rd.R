library(sdm)


### Name: predict
### Title: sdm model prediction
### Aliases: predict predict,sdmModels-method predict,.maxlikeModel-method
### Keywords: spatial,species,data

### ** Examples

## Not run: 
##D 
##D file <- system.file("external/species.shp", package="sdm") # get the location of the species data
##D 
##D species <- shapefile(file) # read the shapefile
##D 
##D path <- system.file("external", package="sdm") # path to the folder contains the data
##D 
##D lst <- list.files(path=path,pattern='asc$',full.names = T) # list the name of the raster files 
##D 
##D 
##D # stack is a function in the raster package, to read/create a multi-layers raster dataset
##D preds <- stack(lst) # making a raster object
##D 
##D d <- sdmData(formula=Occurrence~., train=species, predictors=preds)
##D 
##D d
##D 
##D # fit the models (5 methods, and 10 replications using bootstrapping procedure):
##D m <- sdm(Occurrence~.,data=d,methods=c('rf','tree','fda','mars','svm'),
##D           replicatin='boot',n=10)
##D     
##D # predict for all the methods and replications:    
##D p1 <- predict(m, newdata=preds, filename='preds.img')
##D plot(p1)
##D 
##D # predict for all the methods but take the mean over all replications for each replication method:
##D p2 <- predict(m, newdata=preds, filename='preds.img',mean=T)
##D plot(p2)
##D 
## End(Not run)



