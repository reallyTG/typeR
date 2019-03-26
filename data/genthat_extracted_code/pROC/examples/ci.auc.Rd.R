library(pROC)


### Name: ci.auc
### Title: Compute the confidence interval of the AUC
### Aliases: ci.auc ci.auc.auc ci.auc.default ci.auc.formula ci.auc.roc
###   ci.auc.smooth.roc
### Keywords: univar nonparametric utilities roc

### ** Examples

data(aSAH)

# Syntax (response, predictor):
ci.auc(aSAH$outcome, aSAH$s100b)

# With a roc object:
rocobj <- roc(aSAH$outcome, aSAH$s100b)
# default values
ci.auc(rocobj)
ci(rocobj)
ci(auc(rocobj))
ci(rocobj$auc)
ci(rocobj$auc, method="delong")

# Partial AUC and customized bootstrap:
ci.auc(aSAH$outcome, aSAH$s100b,
       boot.n=100, conf.level=0.9, stratified=FALSE, partial.auc=c(1, .8),
       partial.auc.focus="se", partial.auc.correct=TRUE)

# Note that the following will NOT give a CI of the partial AUC:
ci.auc(rocobj, boot.n=500, conf.level=0.9, stratified=FALSE,
       partial.auc=c(1, .8), partial.auc.focus="se", partial.auc.correct=TRUE)
# This is because rocobj$auc is not a partial AUC.
## Not run: 
##D # You can overcome this problem with reuse.auc:
##D ci.auc(rocobj, boot.n=500, conf.level=0.9, stratified=FALSE,
##D        partial.auc=c(1, .8), partial.auc.focus="se", partial.auc.correct=TRUE,
##D        reuse.auc=FALSE)
## End(Not run)

# Alternatively, you can get the CI directly from roc():
rocobj <- roc(aSAH$outcome, aSAH$s100b, ci=TRUE, of="auc")
rocobj$ci

## Not run: 
##D # On a smoothed ROC, the CI is re-computed automatically
##D smooth(rocobj)
##D # Or you can compute a new one:
##D ci.auc(smooth(rocobj, method="density", reuse.ci=FALSE), boot.n=100)
## End(Not run)



