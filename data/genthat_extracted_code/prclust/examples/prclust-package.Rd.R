library(prclust)


### Name: prclust-package
### Title: Penalized Regression Based Cluster Method
### Aliases: prclust-package prclust
### Keywords: prclust-package

### ** Examples

## In default, we use DC-ADMM, a faster algorithm to solve 
## the objective function and get the clustering result.
library("prclust")
## generate the data
data = matrix(NA,2,100)
data[1,1:50] = rnorm(50,0,0.33)
data[2,1:50] = rnorm(50,0,0.33)
data[1,51:100] = rnorm(50,1,0.33)
data[2,51:100] = rnorm(50,1,0.33)

# clustering via PRclsut 
a =PRclust(data,lambda1=0.4,lambda2=1,tau=0.5)
a$mu
a$group



