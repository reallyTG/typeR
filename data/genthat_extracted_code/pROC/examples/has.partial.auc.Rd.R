library(pROC)


### Name: has.partial.auc
### Title: Does the ROC curve have a partial AUC?
### Aliases: has.partial.auc has.partial.auc.smooth.roc has.partial.auc.auc
###   has.partial.auc.roc
### Keywords: programming logic roc

### ** Examples

data(aSAH)

# Full AUC
roc1 <- roc(aSAH$outcome, aSAH$s100b)
has.partial.auc(roc1)
has.partial.auc(auc(roc1))
has.partial.auc(smooth(roc1))

# Partial AUC
roc2 <- roc(aSAH$outcome, aSAH$s100b, partial.auc = c(1, 0.9))
has.partial.auc(roc2)
has.partial.auc(smooth(roc2))

# No AUC
roc3 <- roc(aSAH$outcome, aSAH$s100b, auc = FALSE)
has.partial.auc(roc3)



