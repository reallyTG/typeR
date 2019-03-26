library(GAMens)


### Name: GAMens
### Title: Applies the GAMbag, GAMrsm or GAMens ensemble classifier to a
###   data set
### Aliases: GAMens
### Keywords: classif models

### ** Examples



## Load data (mlbench library should be loaded)
library(mlbench)
data(Ionosphere)
IonosphereSub<-Ionosphere[,c("V1","V2","V3","V4","V5","Class")]

## Train GAMens using all variables in Ionosphere dataset
Ionosphere.GAMens <- GAMens(Class~., IonosphereSub ,4 , autoform=TRUE,
iter=10 )

## Compare classification performance of GAMens, GAMrsm and GAMbag ensembles,
## using 4 nonparametric terms and 2 linear terms
Ionosphere.GAMens <- GAMens(Class~s(V3,4)+s(V4,4)+s(V5,3)+s(V6,5)+V7+V8,
Ionosphere ,3 , autoform=FALSE, iter=10 )

Ionosphere.GAMrsm <- GAMens(Class~s(V3,4)+s(V4,4)+s(V5,3)+s(V6,5)+V7+V8,
Ionosphere ,3 , autoform=FALSE, iter=10, bagging=FALSE, rsm=TRUE )

Ionosphere.GAMbag <- GAMens(Class~s(V3,4)+s(V4,4)+s(V5,3)+s(V6,5)+V7+V8,
Ionosphere ,3 , autoform=FALSE, iter=10, bagging=TRUE, rsm=FALSE )

## Calculate AUCs (for function colAUC, load caTools library)
library(caTools)
GAMens.auc <- colAUC(Ionosphere.GAMens[[9]], Ionosphere["Class"]=="good",
plotROC=FALSE)
GAMrsm.auc <- colAUC(Ionosphere.GAMrsm[[9]], Ionosphere["Class"]=="good",
plotROC=FALSE)
GAMbag.auc <- colAUC(Ionosphere.GAMbag[[9]], Ionosphere["Class"]=="good",
plotROC=FALSE)




