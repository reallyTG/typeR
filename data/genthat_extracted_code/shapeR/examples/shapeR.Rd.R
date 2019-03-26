library(shapeR)


### Name: shapeR
### Title: shapeR
### Aliases: shapeR shapeR-class shapeR-package

### ** Examples

## Not run: 
##D 
##D # This example has two sections: (1) Demonstration of how a shapeR object
##D # is analyzed and (2) How to create a shapeR object from an archive of
##D # image files.
##D 
##D #-----------------------------------------
##D # Section 1: Analyzing a shapeR object
##D 
##D data(shape)
##D 
##D #Standardize coefficients
##D shape = stdCoefs(shape,"pop","length_cm")
##D 
##D #Visualize Wavelet and Fourier coefficients
##D plotWavelet(shape,level=5,class.name= "pop",useStdcoef=TRUE)
##D plotFourier(shape,class.name= "pop",useStdcoef=TRUE)
##D 
##D #Examine the mean shapes
##D plotWaveletShape(shape, "pop",show.angle = TRUE,lwd=2,lty=1)
##D plotFourierShape(shape, "pop",show.angle = TRUE,lwd=2,lty=1)
##D 
##D #Canonical analysis
##D library(vegan)
##D cap.res = capscale(getStdWavelet(shape) ~ getMasterlist(shape)$pop)
##D anova(cap.res)
##D 
##D #Visualize the canonical scores
##D eig=eigenvals(cap.res,constrained=TRUE)
##D eig.ratio = eig/sum(eig)
##D 
##D cluster.plot(scores(cap.res)$sites[,1:2],getMasterlist(shape)$pop
##D ,plotCI=TRUE
##D ,xlab=paste("CAP1 (",round(eig.ratio[1]*100,1),"%)",sep="")
##D ,ylab=paste("CAP2 (",round(eig.ratio[2]*100,1),"%)",sep="")
##D ,main="Canonical clustering"
##D )
##D 
##D #Only analyze Icelandic and Norwegian samples
##D shape = setFilter(shape, getMasterlist(shape, useFilter = FALSE)$pop %in% c("NO","IC"))
##D 
##D #Classifier on standardized wavelet
##D lda.res.w = lda(getStdWavelet(shape),getMasterlist(shape)$pop,CV=TRUE)
##D ct.w = table(getMasterlist(shape)$pop,lda.res.w$class)
##D 
##D diag(prop.table(ct.w, 1))
##D 
##D # Total percent correct
##D sum(diag(prop.table(ct.w)))
##D 
##D cap.res = capscale(getStdWavelet(shape) ~ getMasterlist(shape)$pop)
##D anova(cap.res)
##D 
##D #Classifier on canoncial values
##D lda.res.w = lda(scores(cap.res)$sites,getMasterlist(shape)$pop,CV=TRUE)
##D ct.w = table(getMasterlist(shape)$pop,lda.res.w$class)
##D 
##D diag(prop.table(ct.w, 1))
##D 
##D # Total percent correct
##D sum(diag(prop.table(ct.w)))
##D 
##D #-----------------------------------------
##D # Section 2: Creating a shapeR object from image files
##D 
##D # The following example requires the user to download an archive of JPEG
##D # files from https://github.com/lisalibungan/shapeR/
##D # place the ShapeAnalysis directory inside the working directory.
##D 
##D shape = shapeR("~/ShapeAnalysis/","FISH.csv")
##D shape = detect.outline(shape,write.outline.w.org = TRUE)
##D 
##D shape = generateShapeCoefficients(shape)
##D shape = enrich.master.list(shape)
## End(Not run)



