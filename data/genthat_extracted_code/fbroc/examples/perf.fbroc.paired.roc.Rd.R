library(fbroc)


### Name: perf.fbroc.paired.roc
### Title: Calculate performance for paired bootstrapped ROC curves
### Aliases: perf.fbroc.paired.roc

### ** Examples

data(roc.examples)
example <- boot.paired.roc(roc.examples$Cont.Pred, roc.examples$Cont.Pred.Outlier,
                               roc.examples$True.Class, n.boot = 100)
perf(example, metric = "auc")   
# Get difference in TPR at a FPR of 20%   
perf(example, metric = "tpr", fpr = 0.2)    
perf(example, metric = "partial.auc", fpr = c(0, 0.25), 
     show.partial.auc.warning = FALSE)                       



