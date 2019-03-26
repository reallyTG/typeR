library(BaySIC)


### Name: baysic.test
### Title: BaySIC Evaluation of SMGs
### Aliases: baysic.test

### ** Examples

## Not run: 
##D data(example.dat)
##D data(ccds.19)
##D baysic.dat.ex<-baysic.data(example.dat,ccds.19)
##D snv.cat.ex<-list()
##D snv.cat.ex[[1]]<-grep("[^T]C[^G]",colnames(ccds.19)[-c(1:2)])
##D snv.cat.ex[[2]]<-unique(c(grep("TC.",colnames(ccds.19)[-c(1:2)]),grep(".CG",colnames(ccds.19)[-c(1:2)])))
##D snv.cat.ex[[3]]<-grep(".T.",colnames(ccds.19)[-c(1:2)])
##D baysic.fit.ex<-baysic.fit(baysic.dat.ex,snv.cat.ex)
##D baysic.test.ex<-baysic.test(baysic.dat.ex,baysic.fit.ex)
## End(Not run)



