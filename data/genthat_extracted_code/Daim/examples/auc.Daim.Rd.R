library(Daim)


### Name: auc.Daim
### Title: The area under the ROC curve (AUC)
### Aliases: auc auc.Daim
### Keywords: classif manip

### ** Examples


  data(Daim.data1)
  perform <- performDaim(Daim.data1$prob.oob, Daim.data1$labels,
                         Daim.data1$prob.app)

  auc(perform)
  roc.area(perform)




