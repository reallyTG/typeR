library(pROC)


### Name: print
### Title: Print a ROC curve object
### Aliases: print.roc print.smooth.roc print.multiclass.roc print.ci.auc
###   print.ci.thresholds print.ci.coords print.ci.se print.ci.sp print.auc
###   print.multiclass.auc
### Keywords: univar nonparametric utilities print roc

### ** Examples

data(aSAH)

# Print a roc object:
rocobj <- roc(aSAH$outcome, aSAH$s100b)
print(rocobj)

# Print a smoothed roc object
print(smooth(rocobj))

# implicit printing
 roc(aSAH$outcome, aSAH$s100b)

# Print an auc and a ci object, from the ROC object or calling
# the dedicated function:
print(rocobj$auc)
print(ci(rocobj))



