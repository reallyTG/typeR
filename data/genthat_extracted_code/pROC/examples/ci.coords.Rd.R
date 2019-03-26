library(pROC)


### Name: ci.coords
### Title: Compute the confidence interval of arbitrary coordinates
### Aliases: ci.coords ci.coords.default ci.coords.formula ci.coords.roc
###   ci.coords.smooth.roc
### Keywords: univar nonparametric utilities roc

### ** Examples

data(aSAH)

## Not run: 
##D # Syntax (response, predictor):
##D ci.coords(aSAH$outcome, aSAH$s100b, x="best", input = "threshold", 
##D           ret=c("specificity", "ppv", "tp"))
##D 
##D # With a roc object:
##D rocobj <- roc(aSAH$outcome, aSAH$s100b)
##D ci.coords(rocobj, x=0.9, input = "sensitivity", ret="specificity")
##D ci.coords(rocobj, x=0.9, input = "sensitivity", ret=c("specificity", "ppv", "tp"))
##D ci.coords(rocobj, x=c(0.1, 0.5, 0.9), input = "sensitivity", ret="specificity")
##D ci.coords(rocobj, x=c(0.1, 0.5, 0.9), input = "sensitivity", ret=c("specificity", "ppv", "tp"))
##D 
##D # With a smoothed roc:
##D rocobj <- roc(aSAH$outcome, aSAH$s100b)
##D ci.coords(smooth(rocobj), x=0.9, input = "sensitivity", ret=c("specificity", "ppv", "tp"))
##D 
##D # Return everything we can:
##D rets <- c("threshold", "specificity", "sensitivity", "accuracy", "tn", "tp", "fn", "fp", "npv", 
##D           "ppv", "1-specificity", "1-sensitivity", "1-accuracy", "1-npv", "1-ppv")
##D ci.coords(rocobj, x="best", input = "threshold", ret=rets)
## End(Not run)
## Don't show: 
ci.coords(aSAH$outcome, aSAH$s100b, x="best", input = "threshold",
          ret=c("specificity", "ppv", "tp"), boot.n=10)
rocobj <- roc(aSAH$outcome, aSAH$s100b)
ci.coords(rocobj, x=0.9, input = "sensitivity", ret="specificity", boot.n=10)
ci.coords(rocobj, x=0.9, input = "sensitivity", ret=c("specificity", "ppv", "tp"), boot.n=10)
ci.coords(rocobj, x=c(0.1, 0.5, 0.9), input = "sensitivity", ret="specificity", boot.n=10)
ci.coords(rocobj, x=c(0.1, 0.5, 0.9), input = "sensitivity", ret=c("specificity", "ppv", "tp"), boot.n=10)
rocobj <- roc(aSAH$outcome, aSAH$s100b)
ci.coords(smooth(rocobj), x=0.9, input = "sensitivity", ret=c("specificity", "ppv", "tp"),
          boot.n=10)
rets <- c("threshold", "specificity", "sensitivity", "accuracy", "tn", "tp", "fn", "fp", "npv", 
          "ppv", "1-specificity", "1-sensitivity", "1-accuracy", "1-npv", "1-ppv")
ci.coords(rocobj, x="best", input = "threshold", ret=rets, boot.n=3)
## End(Don't show)



