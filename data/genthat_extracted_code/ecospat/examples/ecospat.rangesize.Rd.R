library(ecospat)


### Name: ecospat.rangesize
### Title: Quantification of the range size of a species using habitat
###   suitability maps and IUCN criteria)
### Aliases: ecospat.rangesize
### Keywords: file

### ** Examples


## Not run: 
##D 
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
##D ### make binary maps
##D 
##D # use MPA to convert suitability to binary map
##D mpa.cutoff <- ecospat.mpa(pred,occ)
##D 
##D # use Boyce index to convert suitability to binary map
##D boyce <- ecospat.boyce(pred,  occ)
##D ### use the boyce index to find a threshold
##D pred.bin.arbitrary <- ecospat.binary.model(pred,0.5)
##D 
##D pred.bin.mpa <- ecospat.binary.model(pred,mpa.cutoff)
##D names(pred.bin.mpa) <- "me.mpa"
##D pred.bin.arbitrary <- ecospat.binary.model(pred,0.5)
##D names(pred.bin.arbitrary) <- "me.arbitrary"
##D 
##D ### rangesize calculations
##D 
##D library(rgeos)
##D 
##D rangesize <- ecospat.rangesize(stack(pred.bin.mpa,pred.bin.arbitrary),
##D                                xy=occ,
##D                                resol=c(1,1),
##D                                eoo.around.modelocp =TRUE,
##D                                AOO.circles = TRUE,
##D                                d=200000,
##D                                lonlat =TRUE)
##D rangesize$RangeSize
##D 
##D names(rangesize$RangeObjects)
##D 
##D par(mfrow=c(1,3))
##D 
##D plot(ecospat.binary.model(pred,0),legend=FALSE, main="IUCN criteria")
##D 
##D ### IUCN criteria & derivates
##D 
##D # plot AOO
##D plot(rangesize$RangeObjects$AOO,add=TRUE, col="red",legend=FALSE)
##D 
##D # plot EOO
##D plot(rangesize$RangeObjects$EOO@polygons,add=TRUE, border="red", lwd=2)
##D 
##D # plot circles around occurrences
##D plot(rangesize$RangeObjects$AOO.circle@polygons,add=TRUE,border="blue")
##D 
##D for(i in 1:2){
##D   ## plot the occupied patches of the model
##D   plot(rangesize$RangeObjects$models.ocp[[i]],col=c("grey","blue","darkgreen"),
##D   main=names(rangesize$RangeObjects$models.ocp[[i]]),legend=FALSE)
##D   points(occ,col="red",cex=0.5,pch=19)
##D   ## plot EOO around model
##D   plot(rangesize$RangeObjects$eoo.around.model[[i]]@polygons,add=TRUE,border="blue",lwd=2)
##D   ## plot EOO around occupied patches
##D   plot(rangesize$RangeObjects$eoo.around.mo.ocp[[i]]@polygons,add=TRUE,border="darkgreen",
##D   lwd=2)
##D   ## plot the modeled area within EOO
##D   #plot(rangesize$RangeObjects$model.within.eoo[[i]],col=c("grey","blue","darkgreen"),legend=FALSE)
##D   #points(occ,col="red",cex=0.5,pch=19)
##D   #plot(rangesize$RangeObjects$EOO@polygons,add=TRUE, border="red", lwd=2)
##D }
##D par(mfrow=c(1,1))
##D 
##D ### Alpha-hulls are not included in the function yet because of Licence limitations.
##D ### However, alpha-hulls can easily be included manually (see also the help file of 
##D ### the alpha hull package):
##D 
##D require(alphahull)
##D alpha = 2 # alpha value of 2 recommended by IUCN
##D   
##D del<-delvor(occ)
##D dv<-del$mesh
##D mn <- mean(sqrt(abs(del$mesh[,3]-del$mesh[,5])^2+abs(del$mesh[,4]-del$mesh[,6])^2))*alpha
##D alpha.hull<-ahull(del,alpha=mn) 
##D   
##D #Size of alpha-hulls
##D #areaahull(alpha.hull) #works but uses a deprecated function in alphahull 2.1
##D 
##D #plot alphahulls
##D plot(rangesize$RangeObjects$models.ocp[[i]],col=c("grey","blue","darkgreen"),
##D main=names(rangesize$RangeObjects$models.ocp[[i]]),legend=FALSE)
##D plot(alpha.hull,add=TRUE,lwd=1)
## End(Not run)



