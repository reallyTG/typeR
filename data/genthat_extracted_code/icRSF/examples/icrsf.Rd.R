library(icRSF)


### Name: icrsf
### Title: Permutation-based variable importance metric for high
###   dimensional datasets appropriate for time to event outcomes, in the
###   presence of imperfect self-reports or laboratory-based diagnostic
###   tests.
### Aliases: icrsf

### ** Examples

library(parallel)
data(Xmat)
data(pheno)
vimp <- icrsf(data=pheno, subject=ID, testtimes=time, result=result, sensitivity=1,
             specificity=1, Xmat=Xmat, root.size=30, ntree=1, ns=sqrt(ncol(Xmat)), node=1, pval=1)




