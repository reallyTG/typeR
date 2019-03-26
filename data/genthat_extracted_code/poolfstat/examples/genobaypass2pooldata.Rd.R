library(poolfstat)


### Name: genobaypass2pooldata
### Title: Convert BayPass read count and haploid pool size input files
###   into a pooldata object
### Aliases: genobaypass2pooldata

### ** Examples

 make.example.files(writing.dir=tempdir())
 pooldata=popsync2pooldata(sync.file=paste0(tempdir(),"/ex.sync.gz"),poolsizes=rep(50,15))
 pooldata2genobaypass(pooldata=pooldata,writing.dir=tempdir())
 pooldata=genobaypass2pooldata(genobaypass.file=paste0(tempdir(),"/genobaypass"),
                               poolsize.file=paste0(tempdir(),"/poolsize"))



