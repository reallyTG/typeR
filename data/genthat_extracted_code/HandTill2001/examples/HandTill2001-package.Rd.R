library(HandTill2001)


### Name: HandTill2001-package
### Title: Multiple Class Area under ROC Curve
### Aliases: HandTill2001-package HandTill2001
### Keywords: AUC, ROC

### ** Examples

library(HandTill2001)
data(ht01.multipleclass)
auc( 
  multcap(
     response = ht01.multipleclass$observed
    , predicted = as.matrix(ht01.multipleclass[, levels(ht01.multipleclass$observed)])
    )
    )



