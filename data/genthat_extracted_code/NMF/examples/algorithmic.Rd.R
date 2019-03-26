library(NMF)


### Name: algorithmic-NMF
### Title: Generic Interface for Algorithms
### Aliases: algorithm algorithm<- algorithmic-NMF algorithm<--methods
###   algorithm-methods algorithm<-,NMFfit,ANY-method
###   algorithm,NMFfit-method algorithm,NMFfitXn-method
###   algorithm<-,NMFSeed,function-method algorithm,NMFSeed-method
###   algorithm<-,NMFStrategyFunction,function-method
###   algorithm,NMFStrategyFunction-method compare compare-methods
###   compare,NMFfitXn-method logs logs,ANY-method logs-methods modelname
###   modelname,ANY-method modelname-methods modelname,NMFfit-method
###   modelname,NMFfitXn-method modelname,NMFStrategy-method niter niter<-
###   niter<--methods niter-methods niter,NMFfit-method
###   niter<-,NMFfit,numeric-method nrun nrun,ANY-method nrun-methods
###   nrun,NMFfit-method nrun,NMFfitX1-method nrun,NMFfitX-method
###   nrun,NMFfitXn-method objective objective<- objective<--methods
###   objective-methods objective<-,NMFfit,ANY-method run run-methods
###   runtime runtime.all runtime.all-methods runtime.all,NMFfit-method
###   runtime.all,NMFfitX-method runtime-methods runtime,NMFfit-method
###   seeding seeding<- seeding<--methods seeding-methods
###   seeding<-,NMFfit-method seeding,NMFfit-method seeding,NMFfitXn-method
###   seqtime seqtime-methods seqtime,NMFfitXn-method
###   seqtime,NMFList-method
### Keywords: methods

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

#----------
# modelname,ANY-method
#----------
# get the type of an NMF model
modelname(nmfModel(3))
modelname(nmfModel(3, model='NMFns'))
modelname(nmfModel(3, model='NMFOffset'))

#----------
# modelname,NMFStrategy-method
#----------
# get the type of model(s) associated with an NMF algorithm
modelname( nmfAlgorithm('brunet') )
modelname( nmfAlgorithm('nsNMF') )
modelname( nmfAlgorithm('offset') )



