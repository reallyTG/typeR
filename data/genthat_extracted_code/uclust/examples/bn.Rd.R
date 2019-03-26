library(uclust)


### Name: bn
### Title: Computes Bn Statistic.
### Aliases: bn

### ** Examples

n=5
x=matrix(rnorm(n*10),ncol=10)
bn(c(1,0,0,0,0),data=x)     # option (a) entering the data matrix directly
md=as.matrix(dist(x))^2
bn(c(0,1,1,1,1),md)         # option (b) entering the distance matrix




