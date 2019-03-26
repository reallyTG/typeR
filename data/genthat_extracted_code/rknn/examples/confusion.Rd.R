library(rknn)


### Name: confusion
### Title: Classification Confusion Matrix and Accuracy
### Aliases: confusion confusion2acc
### Keywords: classif

### ** Examples

  obs<- rep(0:1, each =5);
  pre<- c(obs[3:10], obs[1:2])
  confusion(obs, pre)
  confusion2acc(  confusion(obs, pre))



