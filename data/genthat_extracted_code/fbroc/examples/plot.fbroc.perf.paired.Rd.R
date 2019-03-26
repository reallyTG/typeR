library(fbroc)


### Name: plot.fbroc.perf.paired
### Title: Plots the difference between the bootstrapped performance
###   estimate of the first and the second classifier.
### Aliases: plot.fbroc.perf.paired

### ** Examples

data(roc.examples)
example <- boot.paired.roc(roc.examples$Cont.Pred, roc.examples$Cont.Pred.Outlier, 
                           roc.examples$True.Class, n.boot = 100)
auc.diff <- perf(example, "auc")
plot(auc.diff)



