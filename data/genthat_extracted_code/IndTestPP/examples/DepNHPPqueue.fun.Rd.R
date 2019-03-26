library(IndTestPP)


### Name: DepNHPPqueue.fun
### Title: Generates trajectories of dependent Poisson processes based on
###   queue simulation
### Aliases: DepNHPPqueue.fun

### ** Examples

#Generation of 3 dependent HPPs, with  mean service time equal to 10
aux<-DepNHPPqueue.fun(lambda=0.05, d=3, rate=0.1, type="H", nEv=25, 
	fixed.seed=123)
aux$posNHs

#Generation of 3 dependent NHPPs, with  mean service time equal to 10
#lambda<-runif(200,0,0.1)

#aux<-DepNHPPqueue.fun(lambda=lambda, d=3, rate=0.1, type="NH")
#aux$posNHs




