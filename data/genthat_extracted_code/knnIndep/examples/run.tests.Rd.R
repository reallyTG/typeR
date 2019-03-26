library(knnIndep)


### Name: run.tests
### Title: Run several tests of independence on a benchmark of different
###   functional relationships
### Aliases: run.tests

### ** Examples

noises = cbind(lin=c(.1,.5,.8),circ=c(.2,.4,.6))
mycor = function(...) cor(...)^2
results.cor=run.tests(mycor,args=list(),types=c(1,7),noises=noises,nsim=50,size=100)
results = run.tests("novelTest.extreme",args=list(maxi=10),types=c(1,7),noises=noises,nsim=25,
	size=100)
## Not run: 
##D x11()
##D par(mfrow=c(1,ncol(noises)))
##D roc.plot(generate.roc(results,pval=FALSE),legend=noises)
## End(Not run)
power = t(drop(calculate.power(results,.95,`>`)))
power.cor = t(drop(calculate.power(results.cor,.95,`>`)))
#cor is excellent at linear relationships, not so much for circular relationships:
#(increasing power is an artifact of low number of simulation, increase nsim in run.tests)
power.plot(list(cor=power.cor, novelTest=power),noises,show.legend="topright",mains=c("Linear", 
	"Circle")) 



