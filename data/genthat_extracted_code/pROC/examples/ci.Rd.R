library(pROC)


### Name: ci
### Title: Compute the confidence interval of a ROC curve
### Aliases: ci ci.default ci.formula ci.roc ci.smooth.roc
### Keywords: univar nonparametric utilities roc

### ** Examples

data(aSAH)

# Syntax (response, predictor):
ci(aSAH$outcome, aSAH$s100b)

# With a roc object:
rocobj <- roc(aSAH$outcome, aSAH$s100b)

# Of an AUC 
ci(rocobj)
ci(rocobj, of="auc")
# this is strictly equivalent to:
ci.auc(rocobj)

# Of thresholds, sp, se...
## Not run: 
##D ci(rocobj, of="thresholds")
##D ci(rocobj, of="thresholds", thresholds=0.51)
##D ci(rocobj, of="thresholds", thresholds="all")
##D ci(rocobj, of="sp", sensitivities=c(.95, .9, .85))
##D ci(rocobj, of="se")
## End(Not run)

# Alternatively, you can get the CI directly from roc():
rocobj <- roc(aSAH$outcome, aSAH$s100b, ci=TRUE, of="auc")
rocobj$ci




