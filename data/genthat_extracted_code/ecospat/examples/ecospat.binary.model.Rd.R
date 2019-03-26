library(ecospat)


### Name: ecospat.binary.model
### Title: Generate Binary Models
### Aliases: ecospat.binary.model

### ** Examples


## Not run: 
##D library(raster)
##D library(dismo)
##D 
##D ### make a maxent model
##D 
##D # copy maxent.jar file in the right folder
##D path.from<-system.file("extdata", "maxent.txt", package="ecospat")
##D path.to <- paste0(system.file(package="dismo"), "/java/maxent.txt")
##D path.to.renamed <- paste0(system.file(package="dismo"), "/java/maxent.jar")
##D file.copy(path.from,path.to,overwrite = TRUE)
##D file.rename(path.to, path.to.renamed)
##D 
##D if (file.exists(path.to.renamed) & require(rJava)) {
##D 
##D   # get predictor variables
##D   fnames <- list.files(path=paste(system.file(package="dismo"), '/ex', sep=''), 
##D                      pattern='grd', full.names=TRUE )
##D   predictors <- stack(fnames)
##D   #plot(predictors)
##D 
##D   # file with presence points
##D   occurence <- paste(system.file(package="dismo"), '/ex/bradypus.csv', sep='')
##D   occ <- read.table(occurence, header=TRUE, sep=',')[,-1]
##D   colnames(occ) <- c("x","y")
##D   occ <- ecospat.occ.desaggregation(occ,min.dist=1)
##D 
##D   # fit a domain model, biome is a categorical variable
##D   me <- maxent(predictors, occ, factors='biome')
##D 
##D   # predict to entire dataset
##D   pred <- predict(me, predictors) 
##D 
##D   plot(pred)
##D   points(occ)
##D }
##D 
##D ### convert suitability to binary map
##D 
##D mpa.cutoff <- ecospat.mpa(pred,occ,perc = 0.9) # 90 percent of the presences encompassed
##D pred.bin.mpa <- ecospat.binary.model(pred,mpa.cutoff)
##D 
##D plot(pred.bin.mpa)
##D points(occ)
## End(Not run)



