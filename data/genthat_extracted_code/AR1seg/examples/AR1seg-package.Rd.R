library(AR1seg)


### Name: AR1seg-package
### Title: Segmentation of an AR(1) Gaussian process
### Aliases: AR1seg-package AR1seg

### ** Examples

library(AR1seg)
data(y)
res=AR1seg_func(y,Kmax=15,rho=TRUE)
a=c(1,res$PPSelectedBreaks[1:(res$PPselected-1)]+1)
b=res$PPSelectedBreaks[1:(res$PPselected)]
Bounds=cbind(a,b)
mu.fit=rep(res$PPmean,Bounds[,2]-Bounds[,1]+1)
plot(y)
lines(mu.fit,col="red")



