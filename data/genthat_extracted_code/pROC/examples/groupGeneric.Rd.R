library(pROC)


### Name: groupGeneric
### Title: pROC Group Generic Functions
### Aliases: groupGeneric groupGeneric.pROC groupGeneric.auc
###   groupGeneric.ci.coords groupGeneric.ci.se groupGeneric.ci.sp Ops Math
###   Ops.auc Math.auc Ops.ci.coords Math.ci.coords Ops.ci.se Math.ci.se
###   Ops.ci.sp Math.ci.sp Ops.ci.auc Math.ci.auc Ops.ci Math.ci
### Keywords: methods

### ** Examples

data(aSAH)

# Create a roc object:
aucobj1 <- auc(roc(aSAH$outcome, aSAH$s100b))
aucobj2 <- auc(roc(aSAH$outcome, aSAH$wfns))

# Math
sqrt(aucobj1)
round(aucobj2, digits=1)

# Ops
aucobj1 * 2
2 * aucobj2
aucobj1 + aucobj2

# With CI
ciaucobj <- ci(aucobj1)
ciaucobj * 2
sqrt(ciaucobj)




