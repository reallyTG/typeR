library(fda.usc)


### Name: Utilities
### Title: A wrapper for the split and unlist function for fdata object
### Aliases: split.fdata unlist.fdata split.fdata
### Keywords: descriptive

### ** Examples

fdataobj<-fdata(MontrealTemp)
fac<-factor(c(rep(1,len=17),rep(2,len=17)))
a1<-split.fdata(fdataobj,fac)
dim(a1[[1]]);dim(a1[[2]])
a2<-unlist.fdata(a1)
a2==fdataobj



