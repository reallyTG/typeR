library(sdm)


### Name: ensemble
### Title: Ensemble Forecasting of SDMs
### Aliases: ensemble ensemble,sdmModels-method
###   ensemble,sdmModels,Raster-method
### Keywords: spatial,species,data

### ** Examples

## Not run: 
##D 
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
##D # ensemble using weighted averaging based on AUC statistic:    
##D p1 <- ensemble(m, newdata=preds, filename='ens.img',setting=list(method='weighted',stat='AUC'))
##D plot(p1)
##D 
##D # ensemble using weighted averaging based on TSS statistic
##D # and optimum threshold critesion 2 (i.e., Max(spe+sen)) :    
##D p2 <- ensemble(m, newdata=preds, filename='ens2.img',setting=list(method='weighted',
##D                                                                   stat='TSS',opt=2))
##D plot(p2)
##D 
## End(Not run)





