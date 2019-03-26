library(plsdof)


### Name: pcr
### Title: Principal Components Regression
### Aliases: pcr
### Keywords: multivariate

### ** Examples

n<-50 # number of observations
p<-15 # number of variables
X<-matrix(rnorm(n*p),ncol=p)
y<-rnorm(n)

my.pcr<-pcr(X,y,m=10)




