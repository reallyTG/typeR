library(Daim)


### Name: auc
### Title: The area under the ROC curve (AUC)
### Aliases: auc.numeric
### Keywords: classif manip

### ** Examples


  data(Daim.data1)
  perform <- performDaim(Daim.data1$prob.oob, Daim.data1$labels,
                         Daim.data1$prob.app)

  ####
  #### compute the 0.632+ estimation of the AUC.
  ####

  auc(perform$roc$sens632p, perform$roc$spec632p)




