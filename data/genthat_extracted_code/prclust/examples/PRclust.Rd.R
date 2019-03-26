library(prclust)


### Name: PRclust
### Title: Find the Solution of Penalized Regression-Based Clustering.
### Aliases: PRclust
### Keywords: PRclust

### ** Examples

library("prclust")
# To let you have a better understanding about the power and strength
# of PRclust method, 6 examples in original prclust paper were provided.
################################################
### case 1
################################################
## generate the data
data = matrix(NA,2,100)
data[1,1:50] = rnorm(50,0,0.33)
data[2,1:50] = rnorm(50,0,0.33)
data[1,51:100] = rnorm(50,1,0.33)
data[2,51:100] = rnorm(50,1,0.33)
## set the tunning parameter
lambda1 =1
lambda2 = 3
tau = 0.5
a =PRclust(data,lambda1,lambda2,tau)
a





