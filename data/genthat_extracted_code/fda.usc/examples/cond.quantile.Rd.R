library(fda.usc)


### Name: cond.quantile
### Title: Conditional quantile
### Aliases: cond.quantile
### Keywords: distribution

### ** Examples


n= 100
t= seq(0,1,len=101)
beta = t*sin(2*pi*t)^2
x = matrix(NA, ncol=101, nrow=n)
y=numeric(n)
x0<-rproc2fdata(n,seq(0,1,len=101),sigma="wiener")
x1<-rproc2fdata(n,seq(0,1,len=101),sigma=0.1)
x<-x0*3+x1
fbeta = fdata(beta,t)
y<-inprod.fdata(x,fbeta)+rnorm(n,sd=0.1)

prx=x[1:50];pry=y[1:50]
ind=50+1;ind2=51:60
pr0=x[ind];pr10=x[ind2]
ndist=161
gridy=seq(-1.598069,1.598069, len=ndist)
ind4=5
y0 = gridy[ind4]

## Conditional median
med=cond.quantile(qua=0.5,fdata0=pr0,fdataobj=prx,y=pry,fn=cond.F,h=1)

## Not run
## Conditional CI 95% conditional
# lo=cond.quantile(qua=0.025,fdata0=pr0,fdataobj=prx,y=pry,fn=cond.F,h=1)
# up=cond.quantile(qua=0.975,fdata0=pr0,fdataobj=prx,y=pry,fn=cond.F,h=1)
# print(c(lo,med,up))




