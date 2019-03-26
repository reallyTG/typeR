library(LUCIDus)


### Name: pred_lucid
### Title: Model Predictions for LUCID
### Aliases: pred_lucid

### ** Examples

set.seed(10)
IntClusFit <- est_lucid(G=G1,Z=Z1,Y=Y1,K=2,family="binary",Pred=TRUE)
GPred <- G2[1:20,]; ZPred <- Z2[1:20,]
PRED <- pred_lucid(Fit = IntClusFit, G=GPred, CoG = NULL, Z=ZPred, CoY = NULL)



