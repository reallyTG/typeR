library(fbroc)


### Name: boot.paired.roc
### Title: Bootstrap paired ROC curves
### Aliases: boot.paired.roc

### ** Examples

data(roc.examples)
# Do not use cache
example <- boot.paired.roc(roc.examples$Cont.Pred, roc.examples$Cont.Pred.Outlier,
                          roc.examples$True.Class, n.boot = 500)
perf(example, "auc") # estimate difference in auc
perf(example, "tpr", fpr = 0.5) # estimate difference in TPR at a FPR of 50%
plot(example) # show plot
# Cached mode
example <- boot.paired.roc(roc.examples$Cont.Pred, roc.examples$Cont.Pred.Outlier,
                          roc.examples$True.Class, n.boot = 1000, use.cache = TRUE)
conf(example, conf.for = "tpr", steps = 10) # get confidence regions for TPR at FPR
conf(example, conf.for = "fpr", steps = 10) # get confidence regions for FPR at TPR
perf(example, "fpr", tpr = 0.9) # estimate difference in FPR at a TPR of 90%                     



