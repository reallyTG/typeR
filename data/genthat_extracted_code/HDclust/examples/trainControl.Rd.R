library(HDclust)


### Name: trainControl
### Title: Parameters for HMM-VB training.
### Aliases: trainControl

### ** Examples

# setting up multiple initialization schemes
Vb <- vb(1, dim=4, numst=2)
set.seed(12345)
hmmvb <- hmmvbTrain(iris[,1:4], VbStructure=Vb, 
          trControl=trainControl(ninit0=2, ninit1=2, ninit2=2))
show(hmmvb)

# forcing diagonal covariance matrices
Vb <- vb(1, dim=4, numst=2)
set.seed(12345)
hmmvb <- hmmvbTrain(iris[,1:4], VbStructure=Vb, 
          trControl=trainControl(diagCov=TRUE))
show(hmmvb)



