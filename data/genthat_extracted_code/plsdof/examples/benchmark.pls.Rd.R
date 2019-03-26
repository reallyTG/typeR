library(plsdof)


### Name: benchmark.pls
### Title: Comparison of model selection criteria for Partial Least Squares
###   Regression.
### Aliases: benchmark.pls
### Keywords: multivariate

### ** Examples

# generate artificial data
n<-50 # number of examples
p<-5 # number of variables
X<-matrix(rnorm(n*p),ncol=p)
true.coefficients<-runif(p,1,3)
y<-X
my.benchmark<-benchmark.pls(X,y,R=10,true.coefficients=true.coefficients)



