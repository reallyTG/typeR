library(poolfstat)


### Name: pooldata.subset
### Title: Create a subset of the pooldata object that contains Pool-Seq
###   data
### Aliases: pooldata.subset

### ** Examples

 make.example.files(writing.dir=tempdir())
 pooldata=popsync2pooldata(sync.file=paste0(tempdir(),"/ex.sync.gz"),poolsizes=rep(50,15))
 pooldata.subset=pooldata.subset(pooldata,pool.index=c(1,2))



