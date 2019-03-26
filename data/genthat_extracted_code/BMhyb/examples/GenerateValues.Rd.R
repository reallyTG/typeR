library(BMhyb)


### Name: GenerateValues
### Title: Generate parameter values
### Aliases: GenerateValues

### ** Examples

	#parameter of interests
	mu<-1;sigma.sq<-0.1;bt<-1;vH<-0;SE<-0
	#parameters of interest
	par<-c(mu,sigma.sq,bt,vH,SE)
	#the lower bound
	lower=c(-2,0,-10,0,0)
	#the upper bound
	upper<-c(2,1,10,100,100)
	#the examined minimum value
	examined.min<-c(-1.8,0.001,-9.8,0,0)
	#the examined maximum value
	examined.max<-c(1.90,1.1,10.2,100,100)
	#simulate points
	sim.points<-GenerateValues(par, lower, upper, max.tries=100, expand.prob=0,
	examined.max, examined.min)
	names(sim.points)<-c("mu","sigma.sq","bt","vH","SE")
	#show result
	sim.points
	


