library(IndTestPP)


### Name: DepMarkedNHPP.fun
### Title: Generates trajectories of dependent point processes using a
###   marked Poison Process
### Aliases: DepMarkedNHPP.fun

### ** Examples


# Generation of three dependent  point processes using a marked PP
set.seed(123)
lambdaTot<-runif(1000)/10

aux<-DepMarkedNHPP.fun(lambdaTot=lambdaTot,
	MarkovM=cbind(c(0.3,0.1,0.6), c(0.1, 0.6, 0.3), c(0.6, 0.3,0.1)),fixed.seed=123)
print(cbind(aux$posNH, aux$mark))




