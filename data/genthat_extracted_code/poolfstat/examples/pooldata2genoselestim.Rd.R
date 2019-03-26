library(poolfstat)


### Name: pooldata2genoselestim
### Title: Convert a pooldata object into SelEstim input files.
### Aliases: pooldata2genoselestim

### ** Examples

 make.example.files(writing.dir=tempdir())
 pooldata=popsync2pooldata(sync.file=paste0(tempdir(),"/ex.sync.gz"),poolsizes=rep(50,15))
 pooldata2genoselestim(pooldata=pooldata,writing.dir=tempdir())



