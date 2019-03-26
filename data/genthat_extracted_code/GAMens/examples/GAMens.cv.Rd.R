library(GAMens)


### Name: GAMens.cv
### Title: Runs v-fold cross validation with GAMbag, GAMrsm or GAMens
###   ensemble classifier
### Aliases: GAMens.cv
### Keywords: classif models

### ** Examples


## Load data: mlbench library should be loaded!)
library(mlbench)
data(Sonar)
SonarSub<-Sonar[,c("V1","V2","V3","V4","V5","V6","Class")]

## Obtain cross-validated classification performance of GAMrsm
## ensembles, using all variables in the Sonar dataset, based on 5-fold
## cross validation runs

Sonar.cv.GAMrsm <- GAMens.cv(Class~s(V1,4)+s(V2,3)+s(V3,4)+V4+V5+V6,
SonarSub ,5, 4 , autoform=FALSE, iter=10, bagging=FALSE, rsm=TRUE )

## Calculate AUCs (for function colAUC, load caTools library)
library(caTools)

GAMrsm.cv.auc <- colAUC(Sonar.cv.GAMrsm[[2]], SonarSub["Class"]=="R",
plotROC=FALSE)





