library(qtlmt)


### Name: varSelect
### Title: Variable selection
### Aliases: varSelect

### ** Examples

data(etrait)
g55<- varGroup(traits, mdat, zscope=55, method="best")
idx<- sample(1:nrow(traits), replace=FALSE)
varSelect(traits[idx,], group=mdat[,55], scope=1:ncol(traits[idx,]),
   nv=length(g55[[1]]))



