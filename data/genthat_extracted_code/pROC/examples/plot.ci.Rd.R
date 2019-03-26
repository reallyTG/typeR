library(pROC)


### Name: plot.ci
### Title: Plot confidence intervals
### Aliases: plot.ci plot.ci.thresholds plot.ci.se plot.ci.sp
### Keywords: univar nonparametric utilities aplot hplot roc

### ** Examples

data(aSAH)
## Not run: 
##D # Start a ROC plot
##D rocobj <- plot.roc(aSAH$outcome, aSAH$s100b)
##D plot(rocobj)
##D # Thresholds
##D ci.thresolds.obj <- ci.thresholds(rocobj)
##D plot(ci.thresolds.obj)
##D # Specificities
##D plot(rocobj) # restart a new plot
##D ci.sp.obj <- ci.sp(rocobj, boot.n=500)
##D plot(ci.sp.obj)
##D # Sensitivities
##D plot(rocobj) # restart a new plot
##D ci.se.obj <- ci(rocobj, of="se", boot.n=500)
##D plot(ci.se.obj)
##D 
##D # Plotting a shape. We need more
##D ci.sp.obj <- ci.sp(rocobj, sensitivities=seq(0, 1, .01), boot.n=100)
##D plot(rocobj) # restart a new plot
##D plot(ci.sp.obj, type="shape", col="blue")
##D 
##D # Direct syntax (response, predictor):
##D plot.roc(aSAH$outcome, aSAH$s100b,
##D          ci=TRUE, of="thresholds")
## End(Not run)



