library(dlbayes)


### Name: dlanalysis
### Title: dlanalysis
### Aliases: dlanalysis

### ** Examples

p=50
n=5
#generate x
x=matrix(rnorm(n*p),nrow=n)
#generate beta
beta=c(rep(0,10),runif(n=5,min=-1,max=1),rep(0,10),runif(n=5,min=-1,max=1),rep(0,p-30))
#generate y
y=x%*%beta+rnorm(n)
hyper=dlhyper(x,y)
dlresult=dl(x,y,hyper=hyper)
da=dlanalysis(dlresult,alpha=0.05)
da$betamean
da$betamedian
da$LeftCI
da$RightCI





