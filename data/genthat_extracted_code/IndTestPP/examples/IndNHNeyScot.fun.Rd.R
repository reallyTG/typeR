library(IndTestPP)


### Name: IndNHNeyScot.fun
### Title: Generates trajectories of independent Neyman-Scott cluster
###   processes
### Aliases: IndNHNeyScot.fun

### ** Examples

set.seed(123)
lambda<-runif(1000)/10

IndNHNeyScot.fun(lambdaParent=lambda, d=3, lambdaNumP = c(2,3,2),  dist = "normal", 
	sigmaC = 2, fixed.seed=123)




