library(ecospat)


### Name: ecospat.occupied.patch
### Title: Extract occupied patches of a species in geographic space.)
### Aliases: ecospat.occupied.patch
### Keywords: file

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
##D if (file.exists(path.to.renamed) & require(rJava) & require(igraph)) {
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
##D ### to convert suitability to binary map
##D 
##D mpa.cutoff <- ecospat.mpa(pred,occ)
##D 
##D pred.bin.mpa <- ecospat.binary.model(pred,mpa.cutoff)
##D names(pred.bin.mpa) <- "me.mpa"
##D pred.bin.arbitrary <- ecospat.binary.model(pred,0.5)
##D names(pred.bin.arbitrary) <- "me.arbitrary"
##D 
##D ### calculate occupied patch
##D 
##D mpa.ocp  <- ecospat.occupied.patch(pred.bin.mpa,occ)
##D arbitrary.ocp  <- ecospat.occupied.patch(pred.bin.arbitrary,occ)
##D 
##D par(mfrow=c(1,2))
##D plot(mpa.ocp) ## occupied patches: green area
##D points(occ,col="red",cex=0.5,pch=19)
##D plot(arbitrary.ocp)
##D points(occ,col="red",cex=0.5,pch=19)
##D 
##D ## with buffer:
##D mpa.ocp  <- ecospat.occupied.patch(pred.bin.mpa,occ, buffer=500000)
##D arbitrary.ocp  <- ecospat.occupied.patch(pred.bin.arbitrary,occ, buffer=500000)
##D 
##D plot(mpa.ocp) ## occupied patches: green area
##D points(occ,col="red",cex=0.5,pch=19)
##D plot(arbitrary.ocp)
##D points(occ,col="red",cex=0.5,pch=19)
## End(Not run)




