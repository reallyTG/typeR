library(IndTestPP)


### Name: DistShift.fun
### Title: Shifts, conditionally on the first process, the remaining
###   processes in a set of up to three processes and calculates the set of
###   close points and the mean distance for each point in the first
###   process
### Aliases: DistShift.fun

### ** Examples


set.seed(123)
lambdax<-runif(200, 0.01,0.17)
set.seed(124)
lambday<-runif(200, 0.015,0.15)
set.seed(125)
lambdaz<-runif(200, 0.005,0.1)
posx<-simNHPc.fun(lambda=lambdax, fixed.seed=123)$posNH
posy<-simNHPc.fun(lambda=lambday, fixed.seed=123)$posNH
posz<-simNHPc.fun(lambda=lambdaz, fixed.seed=123)$posNH

DistShift.fun(posx=posx,posy=posy,posz=posz,T=200, 
	shii1=59, shii2=125 )




