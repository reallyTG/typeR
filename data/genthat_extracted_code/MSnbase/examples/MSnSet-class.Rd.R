library(MSnbase)


### Name: MSnSet-class
### Title: The "MSnSet" Class for MS Proteomics Expression Data and
###   Meta-Data
### Aliases: MSnSet-class class:MSnSet MSnSet acquisitionNum,MSnSet-method
###   exprs,MSnSet-method dim,MSnSet-method fileNames,MSnSet-method
###   msInfo,MSnSet-method processingData,MSnSet-method qual,MSnSet-method
###   qual show,MSnSet-method purityCorrect,MSnSet-method
###   purityCorrect,MSnSet,matrix-method meanSdPlot,MSnSet-method t.MSnSet
###   [,MSnSet-method [,MSnSet,ANY,ANY-method [,MSnSet,ANY,ANY,ANY-method
###   as.ExpressionSet.MSnSet as.MSnSet.ExpressionSet as.data.frame.MSnSet
###   ms2df coerce,IBSpectra,MSnSet-method
###   coerce,MSnSet,ExpressionSet-method coerce,ExpressionSet,MSnSet-method
###   coerce,MSnSet,data.frame-method
###   coerce,MSnSet,SummarizedExperiment-method
###   coerce,SummarizedExperiment,MSnSet-method addMSnSetMetadata
###   write.exprs write.exprs,MSnSet-method
###   experimentData<-,MSnSet,MIAPE-method pData<-,MSnSet,data.frame-method
###   fData<-,MSnSet,data.frame-method combine,MSnSet,MSnSet-method
###   topN,MSnSet,MSnSet-method topN,MSnSet-method topN,matrix-method topN
###   filterNA,MSnSet-method filterNA,matrix-method filterNA
###   filterZero,MSnSet-method filterZero,matrix-method filterZero
###   filterMsLevel,MSnSet-method log,MSnSet-method image,MSnSet-method
###   image2 MAplot,MSnSet-method
###   addIdentificationData,MSnSet,character-method
###   addIdentificationData,MSnSet,mzIDClasses-method
###   addIdentificationData,MSnSet,mzID-method
###   addIdentificationData,MSnSet,mzRident-method
###   addIdentificationData,MSnSet,mzIDCollection-method
###   addIdentificationData,MSnSet,data.frame-method
###   removeNoId,MSnSet-method removeMultipleAssignment-method
###   removeMultipleAssignment,MSnSet-method removeMultipleAssignment
###   idSummary,MSnSet-method idSummary fromFile,MSnSet-method trimws
###   trimws,MSnSet-method trimws,data.frame-method exptitle,MSnSet-method
###   expemail,MSnSet-method ionSource,MSnSet-method analyser,MSnSet-method
###   analyzer,MSnSet-method detectorType,MSnSet-method
###   description,MSnSet-method updateFvarLabels updateSampleNames
###   updateFeatureNames droplevels.MSnSet
### Keywords: classes

### ** Examples

data(msnset)
msnset <- msnset[10:15]

exprs(msnset)[1, c(1, 4)] <- NA
exprs(msnset)[2, c(1, 2)] <- NA
is.na(msnset)
featureNames(filterNA(msnset, pNA = 1/4))
featureNames(filterNA(msnset, pattern = "0110"))

M <- matrix(rnorm(12), 4)
pd <- data.frame(otherpdata = letters[1:3])
fd <- data.frame(otherfdata = letters[1:4])
x0 <- MSnSet(M, fd, pd)
sampleNames(x0)

M <- matrix(rnorm(12), 4)
colnames(M) <- LETTERS[1:3]
rownames(M) <- paste0("id", LETTERS[1:4])
pd <- data.frame(otherpdata = letters[1:3])
rownames(pd) <- colnames(M)
fd <- data.frame(otherfdata = letters[1:4])
rownames(fd) <- rownames(M)
x <- MSnSet(M, fd, pd)
sampleNames(x)


## Visualisation

library("pRolocdata")
data(dunkley2006)
image(dunkley2006)
## Changing colours
image(dunkley2006, high = "darkgreen")
image(dunkley2006, high = "darkgreen", low = "yellow")
## Forcing feature names
image(dunkley2006, fnames = TRUE)
## Facetting
image(dunkley2006, facetBy = "replicate")
p <- image(dunkley2006)
library("ggplot2") ## for facet_grid
p + facet_grid(replicate ~ membrane.prep, scales = 'free', space = 'free')
p + facet_grid(markers ~ replicate)
## Fold-changes
dd <- dunkley2006
exprs(dd) <- exprs(dd) - 0.25
image(dd)
image(dd, low = "green", high = "red")
## Feature names are displayed by default for smaller data
dunkley2006 <- dunkley2006[1:25, ]
image(dunkley2006)
image(dunkley2006, legend = "hello")


## Coercion
if (require("SummarizedExperiment")) {
    data(msnset)
    se <- as(msnset, "SummarizedExperiment")
    metadata(se) ## only logging
    se <- addMSnSetMetadata(se, msnset)
    metadata(se) ## all metadata
    msnset2 <- as(se, "MSnSet")
    processingData(msnset2)
}

as(msnset, "ExpressionSet")




