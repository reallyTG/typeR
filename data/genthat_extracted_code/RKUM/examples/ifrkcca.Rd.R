library(RKUM)


### Name: ifrkcca
### Title: Influence Function of Robust Kernel Canonical Analysis
### Aliases: ifrkcca

### ** Examples


##Dummy data:

X <- matrix(rnorm(500),100); Y <- matrix(rnorm(500),100)

ifrkcca(X,Y, lossfu = "Huber", kernel = "rbfdot", gamma = 0.00001, ncomps = 10, jth = 2)



