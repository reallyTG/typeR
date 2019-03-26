## ---- echo=F-------------------------------------------------------------
set.seed(1)

## ----Load R packages-----------------------------------------------------

library(PAC)



## ----Load data-----------------------------------------------------------
sampleIDs<-c("Basal", "BCR", "IL7")


## ----PAC and Network Inference-------------------------------------------
samplePass(sampleIDs, dim_subset=NULL, hyperrectangles=35, num_PACSupop=25, num_networkEdge=25, max.iter=50)

## ----MAN-----------------------------------------------------------------

clades_network_only<-MAN(sampleIDs, num_PACSupop=25, smallSubpopCutoff=100, k_clades=5)


## ----refine PAC labels with MAN clade results----------------------------
refineSubpopulationLabels(sampleIDs,dim_subset=NULL, clades_network_only, expressionGroupClamp=5)

## ----Clade Networks------------------------------------------------------
getRepresentativeNetworks(sampleIDs, dim_subset=NULL, SubpopSizeFilter=200, num_networkEdge=25)

## ----Annotation----------------------------------------------------------
aggregateMatrix_withAnnotation<-annotateClades(sampleIDs, topHubs=4)
head(aggregateMatrix_withAnnotation)


## ----Heatmap input and plot heatmap--------------------------------------
cladeProportionMatrix<-heatmapInput(aggregateMatrix_withAnnotation)
heatmap(as.matrix(cladeProportionMatrix))

## ----Append subpopulation proporation for each sample--------------------
annotationMatrix_prop<-annotationMatrix_withSubpopProp(aggregateMatrix_withAnnotation)
head(annotationMatrix_prop)

