library(cvAUC)


### Name: cvAUC
### Title: Cross-validated Area Under the ROC Curve (AUC)
### Aliases: cvAUC

### ** Examples

# Example of how to get CV AUC and plot the curve.
data(ROCR.hiv)
attach(ROCR.hiv)

out <- cvAUC(hiv.svm$predictions, hiv.svm$labels)

#Plot fold AUCs
plot(out$perf, col="grey82", lty=3, main="10-fold CV AUC")

#Plot CV AUC
plot(out$perf, col="red", avg="vertical", add=TRUE)

# See the ci.cvAUC documentation for an example 
# of how to use the `folds` argument.



