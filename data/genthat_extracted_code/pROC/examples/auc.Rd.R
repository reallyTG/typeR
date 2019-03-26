library(pROC)


### Name: auc
### Title: Compute the area under the ROC curve
### Aliases: auc auc.default auc.formula auc.roc auc.smooth.roc
###   auc.multiclass.roc
### Keywords: univar nonparametric utilities roc

### ** Examples

data(aSAH)

# Syntax (response, predictor):
auc(aSAH$outcome, aSAH$s100b)

# With a roc object:
rocobj <- roc(aSAH$outcome, aSAH$s100b)
# Full AUC:
auc(rocobj)
# Partial AUC:
auc(rocobj, partial.auc=c(1, .8), partial.auc.focus="se", partial.auc.correct=TRUE)

# Alternatively, you can get the AUC directly from roc():
roc(aSAH$outcome, aSAH$s100b)$auc
roc(aSAH$outcome, aSAH$s100b,
    partial.auc=c(1, .8), partial.auc.focus="se",
    partial.auc.correct=TRUE)$auc



