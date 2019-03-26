library(pROC)


### Name: coords
### Title: Coordinates of a ROC curve
### Aliases: coords coords.roc coords.smooth.roc
### Keywords: univar nonparametric utilities roc

### ** Examples

data(aSAH)

# Print a roc object:
rocobj <- roc(aSAH$outcome, aSAH$s100b)

coords(rocobj, 0.55)
coords(rocobj, 0.9, "specificity", as.list=TRUE)
coords(rocobj, 0.5, "se", ret="se")
# fully qualified but identical:
coords(roc=rocobj, x=0.5, input="sensitivity", ret="sensitivity")

# Compare with drop=FALSE
coords(rocobj, 0.55, drop=FALSE)
coords(rocobj, 0.9, "specificity", as.list=TRUE, drop=FALSE)

# Same in percent
rocobj <- roc(aSAH$outcome, aSAH$s100b, percent=TRUE)

coords(rocobj, 0.55)
coords(rocobj, 90, "specificity", as.list=TRUE)
coords(rocobj, x=50, input="sensitivity", ret=c("sen", "spec"))

# And with a smoothed ROC curve
coords(smooth(rocobj), 90, "specificity")
coords(smooth(rocobj), 90, "specificity", drop=FALSE)
coords(smooth(rocobj), 90, "specificity", as.list=TRUE)
coords(smooth(rocobj), 90, "specificity", as.list=TRUE, drop=FALSE)

# Get the sensitivities for all thresholds
sensitivities <- coords(rocobj, rocobj$thresholds, "thr", "se")
# This is equivalent to taking sensitivities from rocobj directly
stopifnot(all.equal(as.vector(rocobj$sensitivities), as.vector(sensitivities)))
# You could also write:
sensitivities <- coords(rocobj, "all", ret="se")
stopifnot(all.equal(as.vector(rocobj$sensitivities), as.vector(sensitivities)))

# Get the best threshold
coords(rocobj, "b", ret="t")

# Get the best threshold according to different methods
rocobj <- roc(aSAH$outcome, aSAH$ndka, percent=TRUE)
coords(rocobj, "b", ret="t", best.method="youden") # default
coords(rocobj, "b", ret="t", best.method="closest.topleft")
# and with different weights
coords(rocobj, "b", ret="t", best.method="youden", best.weights=c(50, 0.2))
coords(rocobj, "b", ret="t", best.method="closest.topleft", best.weights=c(5, 0.2))
# and plot them
plot(rocobj, print.thres="best", print.thres.best.method="youden")
plot(rocobj, print.thres="best", print.thres.best.method="closest.topleft")
plot(rocobj, print.thres="best", print.thres.best.method="youden",
                                 print.thres.best.weights=c(50, 0.2)) 
plot(rocobj, print.thres="best", print.thres.best.method="closest.topleft",
                                 print.thres.best.weights=c(5, 0.2)) 

# Return more values:
coords(rocobj, "best", ret=c("threshold", "specificity", "sensitivity", "accuracy",
                           "tn", "tp", "fn", "fp", "npv", "ppv", "1-specificity",
                           "1-sensitivity", "1-accuracy", "1-npv", "1-ppv",
                           "precision", "recall"))
coords(smooth(rocobj), "best", ret=c("threshold", "specificity", "sensitivity", "accuracy",
                           "tn", "tp", "fn", "fp", "npv", "ppv", "1-specificity",
                           "1-sensitivity", "1-accuracy", "1-npv", "1-ppv",
                           "precision", "recall"))
coords(smooth(rocobj), 0.5, ret=c("threshold", "specificity", "sensitivity", "accuracy",
                           "tn", "tp", "fn", "fp", "npv", "ppv", "1-specificity",
                           "1-sensitivity", "1-accuracy", "1-npv", "1-ppv",
                           "precision", "recall"))
                           
# You can use coords to plot for instance a sensitivity + specificity vs. cut-off diagram

plot(specificity + sensitivity ~ threshold, t(coords(rocobj, seq(0, 1, 0.01))), type = "l")

# Plot the Precision-Recall curve
plot(precision ~ recall, t(coords(rocobj, "all", ret = c("recall", "precision"))), type="l")




