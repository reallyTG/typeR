library(fbroc)


### Name: plot.fbroc.conf
### Title: Plots function for object of classfbroc.conf
### Aliases: plot.fbroc.conf

### ** Examples

data(roc.examples)
example <- boot.roc(roc.examples$Cont.Pred, roc.examples$True.Class, n.boot = 100)
# Confidence regions for TPR at specific FPR values
tpr.conf <- conf(example, conf.for = "tpr", steps = 50) 
plot(tpr.conf)
# Confidence regions for FPR at specific TPR values
fpr.conf <- conf(example, conf.for = "fpr", steps = 50) 
plot(fpr.conf) 



