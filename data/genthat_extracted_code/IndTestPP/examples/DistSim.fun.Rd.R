library(IndTestPP)


### Name: DistSim.fun
### Title: Generates a set of up to three independent processes and
###   calculates the set of close points and the mean distance for each
###   point in the first process
### Aliases: DistSim.fun DistSimfix.fun

### ** Examples



#Observed process: PP; simulated processes: two independent PPs 
set.seed(123)
lambdax<-runif(200, 0.01,0.15)
set.seed(124)
lambday<-runif(200, 0.005,0.1)
set.seed(125)
lambdaz<-runif(200, 0.005,0.2)
posaux<-simNHPc.fun(lambda=lambdax, fixed.seed=123)$posNH

DistSimfix.fun(posx=posaux, type = "Poisson", 
	lambdaMarg = cbind(lambday,lambdaz), fixed.seed=123)
#DistSim.fun(posx=posaux, type = "Poisson", 
#	lambdaMarg = cbind(lambday,lambdaz))




