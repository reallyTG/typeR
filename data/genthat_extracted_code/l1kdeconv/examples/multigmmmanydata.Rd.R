library(l1kdeconv)


### Name: multigmmmanydata
### Title: Split the input dataset into several sub list to deconvolution.
### Aliases: multigmmmanydata
### Keywords: distribution

### ** Examples

set.seed(0)
x1=c(rnorm(150, mean=0), rnorm(50, mean=10))
x2=c(rnorm(150, mean=20), rnorm(50, mean=40))
x3=c(rnorm(150, mean=30), rnorm(50, mean=60))
x4=c(rnorm(150, mean=30), rnorm(50, mean=60))
x5=c(rnorm(150, mean=30), rnorm(50, mean=60))
x6=c(rnorm(150, mean=30), rnorm(50, mean=60))
x=list(x1, x2, x3, x4, x5, x6)
multigmmmanydata(x)



