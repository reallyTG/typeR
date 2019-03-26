library(FastRCS)


### Name: plot.FastRCS
### Title: Robust Diagnostic Plots For FastRCS
### Aliases: plot.FastRCS
### Keywords: hplot robust regression

### ** Examples

set.seed(123)
n<-100
p<-3
x0<-matrix(rnorm(n*p),nc=p)
y0<-rnorm(n)
z<-c(rep(0,30),rep(1,70))
x0[1:30,]<-matrix(rnorm(30*p,5,1/100),nc=p)
y0[1:30]<-rnorm(30,10,1/100)
ns<-FRCSnumStarts(p=p,eps=0.4);
results<-FastRCS(x=x0,y=y0,alpha=0.5,nSamp=ns)
plot(results)




