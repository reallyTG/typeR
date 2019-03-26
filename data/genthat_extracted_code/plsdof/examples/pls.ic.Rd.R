library(plsdof)


### Name: pls.ic
### Title: Model selection for Partial Least Squares based on information
###   criteria
### Aliases: pls.ic
### Keywords: multivariate

### ** Examples

n<-50 # number of observations
p<-5 # number of variables
X<-matrix(rnorm(n*p),ncol=p)
y<-rnorm(n)

# compute linear PLS
pls.object<-pls.ic(X,y,m=ncol(X))



