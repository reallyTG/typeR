library(RPMM)


### Name: glcTree
### Title: Gaussian RPMM Tree
### Aliases: glcTree
### Keywords: tree cluster

### ** Examples


data(IlluminaMethylation)

## Not run: 
##D heatmap(IllumBeta, scale="n",
##D   col=colorRampPalette(c("yellow","black","blue"),space="Lab")(128))
## End(Not run)

# Fit Gaussian RPMM
rpmm <- glcTree(IllumBeta, verbose=0)
rpmm

# Get weight matrix and show first few rows
rpmmWeightMatrix <- glcTreeLeafMatrix(rpmm)
rpmmWeightMatrix[1:3,]

# Get class assignments and compare with tissue
rpmmClass <- glcTreeLeafClasses(rpmm)
table(rpmmClass,tissue)

## Not run: 
##D # Plot fit
##D par(mfrow=c(2,2))
##D plot(rpmm) ; title("Image of RPMM Profile")
##D plotTree.glcTree(rpmm) ; title("Dendrogram with Labels")
##D plotTree.glcTree(rpmm, 
##D   labelFunction=function(u,digits) table(as.character(tissue[u$index])))
##D title("Dendrogram with Tissue Counts")
##D 
##D # Alternate initialization
##D rpmm2 <- glcTree(IllumBeta, verbose=0, 
##D   initFunctions=list(glcInitializeSplitEigen(),
##D                      glcInitializeSplitFanny(nu=2.5)))
##D rpmm2
##D 
##D # Alternate split criterion
##D rpmm3 <- glcTree(IllumBeta, verbose=0, maxlev=3,
##D   splitCriterion=glcSplitCriterionLevelWtdBIC)
##D rpmm3
##D 
##D rpmm4 <- glcTree(IllumBeta, verbose=0, maxlev=3,
##D   splitCriterion=glcSplitCriterionJustRecordEverything)
##D rpmm4$rLL$splitInfo$llike1
##D rpmm4$rLL$splitInfo$llike2
## End(Not run)



