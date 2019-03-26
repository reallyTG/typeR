library(uclust)


### Name: var_bn
### Title: Variance of Bn
### Aliases: var_bn

### ** Examples


n=5
x=matrix(rnorm(n*20),ncol=20)
# option (a) entering the data matrix directly and considering a group of size 1
var_bn(c(1,4),data=x)

# option (b) entering the distance matrix and considering a groups of size 2 and 3
md=as.matrix(dist(x))^2
var_bn(c(2,3),md)






