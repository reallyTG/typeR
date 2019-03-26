library(dlbayes)


### Name: dlvs
### Title: Title Do Bayesian variable selection via penalized credible
###   region
### Aliases: dlvs

### ** Examples

{
p=30
n=5
#generate x
x=matrix(rnorm(n*p),nrow=n)
#generate beta
beta=c(rep(0,10),runif(n=5,min=-1,max=1),rep(0,10),runif(n=5,min=-1,max=1))
#generate y
y=x%*%beta+rnorm(n)
hyper=dlhyper(x,y)
dlresult=dl(x,y,hyper=hyper)
dlvs(dlresult)
}



