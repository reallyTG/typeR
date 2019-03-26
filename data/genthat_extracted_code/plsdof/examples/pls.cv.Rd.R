library(plsdof)


### Name: pls.cv
### Title: Model selection for Partial Least Squares based on
###   cross-validation
### Aliases: pls.cv
### Keywords: multivariate

### ** Examples

n<-50 # number of observations
p<-5 # number of variables
X<-matrix(rnorm(n*p),ncol=p)
y<-rnorm(n)

# compute linear PLS
pls.object<-pls.cv(X,y,m=ncol(X))

# define random partioning
groups<-sample(c("a","b","c"),n,replace=TRUE)
pls.object1<-pls.cv(X,y,groups=groups)



