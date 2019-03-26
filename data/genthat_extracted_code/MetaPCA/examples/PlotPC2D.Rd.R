library(MetaPCA)


### Name: PlotPC2D
### Title: MetaPCA: Meta-analysis in the Dimension Reduction of Genomic
###   data
### Aliases: PlotPC2D
### Keywords: PCA MetaAnalysis Microarray

### ** Examples

## Not run: 
##D 	#4 prostate cancer data which have three classes: normal, primary, metastasis
##D 	data(prostate)
##D 	metaPC <- MetaPCA(prostate, method="Angle", doPreprocess=FALSE)
##D 	#Plotting 4 data in the same space with ellipses overlayed!
##D 	coord <- foreach(dd=iter(metaPC$x), .combine=rbind) %do% dd$coord
##D 	PlotPC2D(coord[,1:2], drawEllipse=T, dataset.name="Prostate", .class.order=c("Metastasis","Primary","Normal"), 
##D 			.class.color=c('red','#838383','blue'), .annotation=T, newPlot=T,
##D 			.class2=rep(names(metaPC$x), times=sapply(metaPC$x,function(x)nrow(x$coord))), 
##D 			.class2.order=names(metaPC$x), .points.size=1)
##D 
## End(Not run)



