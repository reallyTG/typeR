library(poolfstat)


### Name: pooldata2genobaypass
### Title: Convert a pooldata object into BayPass input files.
### Aliases: pooldata2genobaypass

### ** Examples

 make.example.files(writing.dir=tempdir())
 pooldata=popsync2pooldata(sync.file=paste0(tempdir(),"/ex.sync.gz"),poolsizes=rep(50,15))
 pooldata2genobaypass(pooldata=pooldata,writing.dir=tempdir())



