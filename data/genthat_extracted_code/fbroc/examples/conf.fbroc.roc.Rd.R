library(fbroc)


### Name: conf.fbroc.roc
### Title: Generates confidence intervals for the TPR for a range of FPRs
###   or vice versa
### Aliases: conf.fbroc.roc

### ** Examples

data(roc.examples)
example <- boot.roc(roc.examples$Cont.Pred, roc.examples$True.Class,
                    n.boot = 100)
conf(example, conf.for = "tpr", steps = 10) # get confidence regions for TPR at FPR
conf(example, conf.for = "fpr", steps = 10) # get confidence regions for FPR at TPR



