library(BootMRMR)


### Name: topsis.meth
### Title: Selection of optimal gene selection method(s)/method(s) through
###   multi-criteria decision analysis
### Aliases: topsis.meth
### Keywords: gene method TOPSIS MCDM

### ** Examples


x=matrix(runif(150), 10, 15)
rownames(x)=paste("Method",1:nrow(x), sep="")
colnames(x)=paste("C",1:ncol(x), sep="")
x=as.data.frame(x)
topsis.meth(x)



