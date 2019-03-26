library(RPMM)


### Name: blcTree
### Title: Beta RPMM Tree
### Aliases: blcTree
### Keywords: tree cluster

### ** Examples

## Not run: 
##D data(IlluminaMethylation)
##D 
##D heatmap(IllumBeta, scale="n",
##D   col=colorRampPalette(c("yellow","black","blue"),space="Lab")(128))
##D 
##D # Fit Gaussian RPMM
##D rpmm <- blcTree(IllumBeta, verbose=0)
##D rpmm
##D 
##D # Get weight matrix and show first few rows
##D rpmmWeightMatrix <- blcTreeLeafMatrix(rpmm)
##D rpmmWeightMatrix[1:3,]
##D 
##D # Get class assignments and compare with tissue
##D rpmmClass <- blcTreeLeafClasses(rpmm)
##D table(rpmmClass,tissue)
##D 
##D # Plot fit
##D par(mfrow=c(2,2))
##D plot(rpmm) ; title("Image of RPMM Profile")
##D plotTree.blcTree(rpmm) ; title("Dendrogram with Labels")
##D plotTree.blcTree(rpmm, 
##D   labelFunction=function(u,digits) table(as.character(tissue[u$index])))
##D title("Dendrogram with Tissue Counts")
##D 
##D # Alternate initialization
##D rpmm2 <- blcTree(IllumBeta, verbose=0, 
##D   initFunctions=list(blcInitializeSplitEigen(),
##D                      blcInitializeSplitFanny(nu=2.5)))
##D rpmm2
##D 
##D # Alternate split criterion
##D rpmm3 <- blcTree(IllumBeta, verbose=0, maxlev=3,
##D   splitCriterion=blcSplitCriterionLevelWtdBIC)
##D rpmm3
##D 
##D rpmm4 <- blcTree(IllumBeta, verbose=0, maxlev=3,
##D   splitCriterion=blcSplitCriterionJustRecordEverything)
##D rpmm4$rLL$splitInfo$llike1
##D rpmm4$rLL$splitInfo$llike2
## End(Not run)



