library(GAMens)


### Name: predict.GAMens
### Title: Predicts from a fitted GAMens object (i.e., GAMbag, GAMrsm or
###   GAMens classifier).
### Aliases: predict.GAMens
### Keywords: classif models

### ** Examples

## Load data, mlbench library should be loaded!)
library(mlbench)
data(Sonar)
SonarSub<-Sonar[,c("V1","V2","V3","V4","V5","V6","Class")]

## Select indexes for training set observations
idx <- c(sample(1:97,60),sample(98:208,70))

## Train GAMrsm using all variables in Sonar dataset. Generate predictions
## for test set observations.
Sonar.GAMrsm <- GAMens(Class~.,SonarSub[idx,], autoform=TRUE, iter=10,
bagging=FALSE, rsm=TRUE)
Sonar.GAMrsm.predict <- predict(Sonar.GAMrsm,SonarSub[-idx,])


## Load data mlbench library should be loaded!)
library(mlbench)
data(Ionosphere)
IonosphereSub<-Ionosphere[,c("V1","V2","V3","V4","V5","V6","V7","V8","Class")]
Ionosphere_s <- IonosphereSub[order(IonosphereSub$Class),]

## Select indexes for training set observations
idx <- c(sample(1:97,60),sample(98:208,70))


## Compare test set classification performance of GAMens, GAMrsm and
## GAMbag ensembles, using using 4 nonparametric terms and 2 linear terms in the
## Ionosphere dataset
Ionosphere.GAMens <- GAMens(Class~s(V3,4)+s(V4,4)+s(V5,3)+s(V6,5)+V7+V8,
IonosphereSub[idx,], autoform=FALSE, iter=10, bagging=TRUE, rsm=TRUE)

Ionosphere.GAMens.predict <- predict(Ionosphere.GAMens,
IonosphereSub[-idx,])

Ionosphere.GAMrsm <- GAMens(Class~s(V3,4)+s(V4,4)+s(V5,3)+s(V6,5)+V7+V8,
IonosphereSub[idx,], autoform=FALSE, iter=10, bagging=FALSE, rsm=TRUE)

Ionosphere.GAMrsm.predict <- predict(Ionosphere.GAMrsm,
IonosphereSub[-idx,])

Ionosphere.GAMbag <- GAMens(Class~s(V3,4)+s(V4,4)+s(V5,3)+s(V6,5)+V7+V8,
IonosphereSub[idx,], autoform=FALSE, iter=10, bagging=TRUE, rsm=FALSE)

Ionosphere.GAMbag.predict <- predict(Ionosphere.GAMbag,
IonosphereSub[-idx,])

## Calculate AUCs(for function colAUC, load caTools library)
library(caTools)
GAMens.auc <- colAUC(Ionosphere.GAMens.predict[[1]],
IonosphereSub[-idx,"Class"]=="good", plotROC=FALSE)

GAMrsm.auc <- colAUC(Ionosphere.GAMrsm.predict[[1]],
Ionosphere[-idx,"Class"]=="good", plotROC=FALSE)

GAMbag.auc <- colAUC(Ionosphere.GAMbag.predict[[1]],
IonosphereSub[-idx,"Class"]=="good", plotROC=FALSE)





