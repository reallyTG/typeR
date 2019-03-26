library(kernlab)


### Name: kcca
### Title: Kernel Canonical Correlation Analysis
### Aliases: kcca kcca,matrix-method
### Keywords: multivariate

### ** Examples


## dummy data
x <- matrix(rnorm(30),15)
y <- matrix(rnorm(30),15)

kcca(x,y,ncomps=2)




