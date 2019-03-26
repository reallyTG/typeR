library(pROC)


### Name: ci.se
### Title: Compute the confidence interval of sensitivities at given
###   specificities
### Aliases: ci.se ci.se.default ci.se.formula ci.se.roc ci.se.smooth.roc
### Keywords: univar nonparametric utilities roc

### ** Examples

data(aSAH)

## Not run: 
##D # Syntax (response, predictor):
##D ci.se(aSAH$outcome, aSAH$s100b)
##D 
##D # With a roc object and less bootstrap:
##D rocobj <- roc(aSAH$outcome, aSAH$s100b)
##D ci.se(rocobj, boot.n=100)
##D 
##D # Customized bootstrap and specific specificities:
##D ci.se(rocobj, c(.95, .9, .85), boot.n=500, conf.level=0.9, stratified=FALSE)
## End(Not run)

# Alternatively, you can get the CI directly from roc():
rocobj <- roc(aSAH$outcome,
              aSAH$s100b, ci=TRUE, of="se", boot.n=100)
rocobj$ci

# Plotting the CI
plot(rocobj)
plot(rocobj$ci)

## Not run: 
##D # On a smoothed ROC, the CI is re-computed automatically
##D smooth(rocobj)
##D # Or you can compute a new one:
##D ci.se(smooth(rocobj, method="density", reuse.ci=FALSE), boot.n=100)
## End(Not run)



