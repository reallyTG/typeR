library(ADMMnet)


### Name: print.ADMMnet
### Title: Print a ADMMnet Object
### Aliases: print.ADMMnet
### Keywords: Print

### ** Examples

###  Linear model  ###
set.seed(1213)
N=100;p=30;p1=5
x=matrix(rnorm(N*p),N,p)
beta=rnorm(p1)
xb=x[,1:p1]
y=rnorm(N,xb)

fiti=ADMMnet(x,y,penalty="Lasso",nlambda=10,nfolds=10) # Lasso
fiti



