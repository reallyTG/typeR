library(IndTestPP)


### Name: IndNHPP.fun
### Title: Generates trajectories of independent Poisson processes
### Aliases: IndNHPP.fun

### ** Examples

set.seed(123)
lambdas<-cbind(runif(500)/10, rep(0.05,500))

IndNHPP.fun(lambdas=lambdas, fixed.seed=123)




