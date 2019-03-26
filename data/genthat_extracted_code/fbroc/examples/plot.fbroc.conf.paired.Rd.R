library(fbroc)


### Name: plot.fbroc.conf.paired
### Title: Plots function for object of class 'fbroc.conf.paired'
### Aliases: plot.fbroc.conf.paired

### ** Examples

data(roc.examples)
example <- boot.paired.roc(roc.examples$Cont.Pred, roc.examples$Cont.Pred.Outlier,
                           roc.examples$True.Class, n.boot = 1000)
# Confidence regions for the difference in TPR at specific FPR values                           
tpr.conf <- conf(example, conf.for = "tpr", steps = 50)
plot(tpr.conf)
# Confidence regions for the difference in FPR at specific TPR values 
fpr.conf <- conf(example, conf.for = "fpr", steps = 50)
plot(fpr.conf) 



