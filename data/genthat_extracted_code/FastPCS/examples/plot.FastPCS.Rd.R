library(FastPCS)


### Name: plot.FastPCS
### Title: Distance plot for FastPCS
### Aliases: plot.FastPCS
### Keywords: hplot robust multivariate

### ** Examples

## generate data
set.seed(123)
n<-100
p<-3
x0<-matrix(rnorm(n*p),nc=p)
x0[1:30,]<-matrix(rnorm(30*p,4.5,1/100),nc=p)
z<-c(rep(0,30),rep(1,70))
nstart<-FPCSnumStarts(p=p,eps=0.4)
results<-FastPCS(x=x0,nSamp=nstart)
colvec<-rep("orange",length(z))
colvec[z==1]<-"blue"
plot.FastPCS(results,col=colvec,pch=16)



