library(icRSF)


### Name: treebuilder
### Title: Permutation-based variable importance metric for high
###   dimensional datasets appropriate for time to event outcomes, in the
###   presence of imperfect self-reports or laboratory-based diagnostic
###   tests.
### Aliases: treebuilder

### ** Examples

data(Xmat)
data(pheno)
tree <- treebuilder(data=pheno, subject=ID, testtimes=time, result=result, sensitivity=1,
                   specificity=1, Xmat=Xmat, root.size=30, ns=sqrt(ncol(Xmat)), pval=1)




