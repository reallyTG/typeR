library(dlbayes)


### Name: dlhyper
### Title: Tune the hyperparameter in the prior distribtuion
### Aliases: dlhyper

### ** Examples

p=50
n=6
#generate x
x=matrix(rnorm(n*p),nrow=n)
#generate beta
beta=c(rep(0,10),runif(n=5,min=-1,max=1),rep(0,10),runif(n=5,min=-1,max=1),rep(0,p-30))
#generate y
y=x%*%beta+rnorm(n)
hyper=dlhyper(x,y)





