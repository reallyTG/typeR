library(BaySIC)


### Name: baysic.fit
### Title: Fits BaySIC BMR model
### Aliases: baysic.fit

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
## End(Not run)



