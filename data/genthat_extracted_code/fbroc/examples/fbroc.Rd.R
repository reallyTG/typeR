library(fbroc)


### Name: fbroc
### Title: fbroc: A package for fast bootstrap analysis and comparison of
###   ROC curves
### Aliases: fbroc fbroc-package

### ** Examples

data(roc.examples)
# work with a single ROC curves
result.boot <- boot.roc(roc.examples$Cont.Pred, roc.examples$True.Class, n.boot = 100)
plot(result.boot)
perf(result.boot, "auc")
perf(result.boot, "auc", conf.level = 0.99)
perf(result.boot, "tpr", conf.level = 0.95, fpr = 0.1)
conf(result.boot, steps = 10)
# work with paired ROC curves
result.boot <- boot.paired.roc(roc.examples$Cont.Pred, roc.examples$Cont.Pred.Outlier, 
                               roc.examples$True.Class, n.boot = 100)
plot(result.boot)
perf(result.boot, "auc")
perf(result.boot, "auc", conf.level = 0.99)
perf(result.boot, "tpr", conf.level = 0.95, fpr = 0.1)
conf(result.boot, steps = 10)



