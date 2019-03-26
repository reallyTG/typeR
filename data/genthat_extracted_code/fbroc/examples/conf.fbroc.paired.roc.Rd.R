library(fbroc)


### Name: conf.fbroc.paired.roc
### Title: Generates confidence intervals for the difference in TPR between
###   two predictors for a range of FPRs or vice versa
### Aliases: conf.fbroc.paired.roc

### ** Examples

data(roc.examples)
example <- boot.paired.roc(roc.examples$Cont.Pred, roc.examples$Cont.Pred.Outlier,
                           roc.examples$True.Class, n.boot = 100)
conf(example, conf.for = "tpr", steps = 10) # get confidence regions for Delta TPR at FPR
conf(example, conf.for = "fpr", steps = 10) # get confidence regions for Delta FPR at TPR



