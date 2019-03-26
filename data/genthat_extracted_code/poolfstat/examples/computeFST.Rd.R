library(poolfstat)


### Name: computeFST
### Title: Compute FST from Pool-Seq data
### Aliases: computeFST

### ** Examples

 make.example.files(writing.dir=tempdir())
 pooldata=popsync2pooldata(sync.file=paste0(tempdir(),"/ex.sync.gz"),poolsizes=rep(50,15))
 res.fst=computeFST(pooldata)



