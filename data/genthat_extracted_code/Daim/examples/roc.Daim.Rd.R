library(Daim)


### Name: roc
### Title: Compute a ROC curve
### Aliases: roc roc.integer roc.numeric roc.matrix roc.data.frame
### Keywords: hplot classif

### ** Examples


  data(Daim.data3)

  M <- roc(Daim.data3[,2:5], Daim.data3$Gold, "pos")
  summary(M)
  plot(M,color=c("black","blue","green3","red"))

  roc.area(M)




