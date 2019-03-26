library(poolfstat)


### Name: computePairwiseFSTmatrix
### Title: Compute pairwise population population FST matrix (and possibly
###   all pairwise SNP-specific FST)
### Aliases: computePairwiseFSTmatrix

### ** Examples

 make.example.files(writing.dir=tempdir())
 pooldata=popsync2pooldata(sync.file=paste0(tempdir(),"/ex.sync.gz"),poolsizes=rep(50,15))
 PairwiseFST=computePairwiseFSTmatrix(pooldata)



