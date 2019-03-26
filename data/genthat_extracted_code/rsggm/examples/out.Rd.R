library(rsggm)


### Name: out
### Title: out (Output parameters for specific gamma and lambda)
### Aliases: out

### ** Examples

#generate data
set.seed(1234)
x <- rsggm.generator(N=200,p=20)

#fit the robust sparse Gaussian graphical modeling
fit <- rsggm(x,gamma=c(0.05,0.1),delta=0.2)

#output the result for specitic gamma and lambda
out(fit,gamma=0.05,lambda=0.2)



