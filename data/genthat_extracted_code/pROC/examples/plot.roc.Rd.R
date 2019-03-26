library(pROC)


### Name: plot.roc
### Title: Plot a ROC curve
### Aliases: plot.roc plot.roc.roc plot.smooth.roc plot.roc.smooth.roc
###   plot.roc.default plot.roc.formula
### Keywords: univar nonparametric utilities aplot hplot roc

### ** Examples

data(aSAH)

# Syntax (response, predictor):
plot.roc(aSAH$outcome, aSAH$s100b)

# With a roc object:
rocobj <- roc(aSAH$outcome, aSAH$s100b)
# identical:
plot(rocobj)
plot.roc(rocobj)

# Add a smoothed ROC:
plot.roc(smooth(rocobj), add=TRUE, col="blue")
legend("bottomright", legend=c("Empirical", "Smoothed"),
       col=c(par("fg"), "blue"), lwd=2)

# With more options:
plot(rocobj, print.auc=TRUE, auc.polygon=TRUE, grid=c(0.1, 0.2),
     grid.col=c("green", "red"), max.auc.polygon=TRUE,
     auc.polygon.col="blue", print.thres=TRUE)

# To plot a different partial AUC, we need to ignore the existing value
# with reuse.auc=FALSE:
plot(rocobj, print.auc=TRUE, auc.polygon=TRUE, partial.auc=c(1, 0.8),
     partial.auc.focus="se", grid=c(0.1, 0.2), grid.col=c("green", "red"),
     max.auc.polygon=TRUE, auc.polygon.col="blue", print.thres=TRUE,
     reuse.auc=FALSE)

# Add a line to the previous plot:
plot.roc(aSAH$outcome, aSAH$wfns, add=TRUE)

# Alternatively, you can get the plot directly from roc():
roc(aSAH$outcome, aSAH$s100b, plot=TRUE)



