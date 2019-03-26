library(dynpred)


### Name: evalstep
### Title: Evaluate step function at a set of new time points
### Aliases: evalstep
### Keywords: univar

### ** Examples

tm <- c(0.2,0.5,1,1.2,1.8,4)
ta <- 2*tm
data.frame(time=tm, stepf=ta)
evalstep(time=tm, stepf=ta, newtime=c(0,0.2,0.3,0.6,1,1.5,3,4,5,0.1), subst=0)
evalstep(time=tm, stepf=data.frame(ta=ta,ta2=1/ta),
	newtime=c(0,0.2,0.3,0.6,1,1.5,3,4,5,0.1), subst=0)



