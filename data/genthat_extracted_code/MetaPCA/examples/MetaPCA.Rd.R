library(MetaPCA)


### Name: MetaPCA
### Title: MetaPCA: Meta-analysis in the Dimension Reduction of Genomic
###   data
### Aliases: MetaPCA
### Keywords: PCA MetaAnalysis Microarray

### ** Examples

## Not run: 
##D 	#Spellman, 1998 Yeast cell cycle data set
##D 	#Consider each synchronization method as a separate data
##D 	data(Spellman) 
##D 	pc <- list(alpha=prcomp(t(Spellman$alpha))$x, cdc15=prcomp(t(Spellman$cdc15))$x,
##D 			cdc28=prcomp(t(Spellman$cdc28))$x, elu=prcomp(t(Spellman$elu))$x)
##D 	#There are currently 4 meta-pca methods. Run either one of following four.
##D 	metaPC <- MetaPCA(Spellman, method="Eigen", doPreprocess=FALSE)
##D 	metaPC <- MetaPCA(Spellman, method="Angle", doPreprocess=FALSE)
##D 	metaPC <- MetaPCA(Spellman, method="RobustAngle", doPreprocess=FALSE)
##D 	metaPC <- MetaPCA(Spellman, method="SparseAngle", doPreprocess=FALSE)
##D 	#Comparing between usual pca and meta-pca
##D 	#The first lows are four data sets based on usual PCA, and 
##D 	#the second rows are by MetaPCA
##D 	#We're looking for a cyclic pattern.
##D 	par(mfrow=c(2,4), cex=1, mar=c(0.2,0.2,0.2,0.2))
##D 	for(i in 1:4) {
##D 		plot(pc[[i]][,1], pc[[i]][,2], type="n", xlab="", ylab="", xaxt="n", yaxt="n")
##D 		text(pc[[i]][,1], pc[[i]][,2], 1:nrow(pc[[i]]), cex=1.5)
##D 		lines(pc[[i]][,1], pc[[i]][,2])
##D 	}
##D 	for(i in 1:4) {
##D 		plot(metaPC$x[[i]]$coord[,1], metaPC$x[[i]]$coord[,2], type="n", xlab="", ylab="", xaxt="n", yaxt="n")
##D 		text(metaPC$x[[i]]$coord[,1], metaPC$x[[i]]$coord[,2], 1:nrow(metaPC$x[[i]]$coord), cex=1.5)
##D 		lines(metaPC$x[[i]]$coord[,1], metaPC$x[[i]]$coord[,2])
##D 	}
##D 
##D 	#4 prostate cancer data which have three classes: normal, primary, metastasis
##D 	data(prostate)
##D 	#There are currently 4 meta-pca methods. Run either one of following four.
##D 	metaPC <- MetaPCA(prostate, method="Eigen", doPreprocess=FALSE, .scale=TRUE)
##D 	metaPC <- MetaPCA(prostate, method="Angle", doPreprocess=FALSE)
##D 	metaPC <- MetaPCA(prostate, method="RobustAngle", doPreprocess=FALSE)
##D 	metaPC <- MetaPCA(prostate, method="SparseAngle", doPreprocess=FALSE)
##D 	#Plotting 4 data in the same space!
##D 	coord <- foreach(dd=iter(metaPC$x), .combine=rbind) %do% dd$coord
##D 	PlotPC2D(coord[,1:2], drawEllipse=F, dataset.name="Prostate", .class.order=c("Metastasis","Primary","Normal"), 
##D 			.class.color=c('red','#838383','blue'), .annotation=T, newPlot=T,
##D 			.class2=rep(names(metaPC$x), times=sapply(metaPC$x,function(x)nrow(x$coord))), 
##D 			.class2.order=names(metaPC$x), .points.size=1)
##D 
##D 	#In the case of "SparseAngle" method, the top contributing genes for all studies can be determined
##D 	#For instance, top 20 genes in 1st PC and their coefficients
##D 	metaPC$v[order(abs(metaPC$v[,1]), decreasing=TRUE),1][1:20] 
##D 
## End(Not run)



