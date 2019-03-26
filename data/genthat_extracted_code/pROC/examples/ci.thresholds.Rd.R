library(pROC)


### Name: ci.thresholds
### Title: Compute the confidence interval of thresholds
### Aliases: ci.thresholds ci.thresholds.default ci.thresholds.formula
###   ci.thresholds.roc ci.thresholds.smooth.roc
### Keywords: univar nonparametric utilities roc

### ** Examples

data(aSAH)

## Not run: 
##D # Syntax (response, predictor):
##D ci.thresholds(aSAH$outcome, aSAH$s100b)
##D 
##D # With a roc object:
##D rocobj <- roc(aSAH$outcome, aSAH$s100b)
##D ci.thresholds(rocobj)
##D 
##D # Customized bootstrap and specific thresholds:
##D ci.thresholds(aSAH$outcome, aSAH$s100b,
##D               boot.n=500, conf.level=0.9, stratified=FALSE,
##D               thresholds=c(0.5, 1, 2))
## End(Not run)

# Alternatively, you can get the CI directly from roc():
rocobj <- roc(aSAH$outcome,
              aSAH$s100b, ci=TRUE, of="thresholds")
rocobj$ci

# Plotting the CI
plot(rocobj)
plot(rocobj$ci)



