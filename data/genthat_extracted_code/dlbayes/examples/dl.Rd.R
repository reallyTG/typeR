library(dlbayes)


### Name: dl
### Title: Implement the Dirichlet Laplace shrinkage prior in Bayesian
###   linear regression
### Aliases: dl

### ** Examples

{
p=50
n=5
#generate x
x=matrix(rnorm(n*p),nrow=n)
#generate beta
beta=c(rep(0,10),runif(n=5,min=-1,max=1),rep(0,10),runif(n=5,min=-1,max=1),rep(0,p-30))
#generate y
y=x%*%beta+rnorm(n)
hyper=dlhyper(x,y)
dlresult=dl(x,y,hyper=hyper)}





