library(pROC)


### Name: ci.sp
### Title: Compute the confidence interval of specificities at given
###   sensitivities
### Aliases: ci.sp ci.sp.default ci.sp.formula ci.sp.roc ci.sp.smooth.roc
### Keywords: univar nonparametric utilities roc

### ** Examples

data(aSAH)

## Not run: 
##D # Syntax (response, predictor):
##D ci.sp(aSAH$outcome, aSAH$s100b)
##D 
##D # With a roc object:
##D rocobj <- roc(aSAH$outcome, aSAH$s100b)
##D ci.sp(rocobj)
##D 
##D # Customized bootstrap and specific specificities:
##D ci.sp(rocobj, c(.95, .9, .85), boot.n=500, conf.level=0.9, stratified=FALSE)
## End(Not run)

# Alternatively, you can get the CI directly from roc():
rocobj <- roc(aSAH$outcome,
              aSAH$s100b, ci=TRUE, of="sp", boot.n=100)
rocobj$ci

# Plotting the CI
plot(rocobj)
plot(rocobj$ci)

## Not run: 
##D # On a smoothed ROC, the CI is re-computed automatically
##D smooth(rocobj)
##D # Or you can compute a new one:
##D ci.sp(smooth(rocobj, method="density", reuse.ci=FALSE), boot.n=100)
## End(Not run)



