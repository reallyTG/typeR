library(rsggm)


### Name: rsggm
### Title: rsggm (Robust Sparse Gaussian Graphical Modeling via the
###   Gamma-Divergence)
### Aliases: rsggm rsggm.generator

### ** Examples

#generate data
set.seed(1234)
x <- rsggm.generator(N=200,p=20)

#fit the robust sparse Gaussian graphical modeling
fit <- rsggm(x,gamma=c(0.05,0.1),delta=0.2)

#output the result for specitic gamma and lambda
out(fit,gamma=0.05,lambda=0.2)



