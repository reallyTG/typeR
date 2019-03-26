library(poolfstat)


### Name: genoselestim2pooldata
### Title: Convert SelEstim read count input files into a pooldata object
### Aliases: genoselestim2pooldata

### ** Examples

 make.example.files(writing.dir=tempdir())
 pooldata=popsync2pooldata(sync.file=paste0(tempdir(),"/ex.sync.gz"),poolsizes=rep(50,15))
 pooldata2genoselestim(pooldata=pooldata,writing.dir=tempdir())
 pooldata=genoselestim2pooldata(genoselestim.file=paste0(tempdir(),"/genoselestim"))



