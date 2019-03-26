library(APML0)


### Name: print.APML0
### Title: Print a APML0 Object
### Aliases: print.APML0
### Keywords: Print

### ** Examples

###  Linear model  ###
set.seed(1213)
N=100;p=30;p1=5
x=matrix(rnorm(N*p),N,p)
beta=rnorm(p1)
xb=x[,1:p1]%*%beta
y=rnorm(N,xb)

fiti2=APML0(x,y,penalty="Lasso",nlambda=10,nfolds=10) # Lasso
fiti2



