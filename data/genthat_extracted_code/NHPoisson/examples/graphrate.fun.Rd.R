library(NHPoisson)


### Name: graphrate.fun
### Title: Plot of the fitted and empirical occurrence rate
### Aliases: graphrate.fun

### ** Examples

##plot of rates based on overlapping intervals
graphrate.fun(emplambda=runif(500,0,1), fittedlambda=runif(500,0,1), 
	t=c(1:500), lint=100, tit="Example", typeI="Overlapping")

#plot of rates based on disjoint intervals
graphrate.fun(emplambda=runif(50,0,1), fittedlambda=runif(50,0,1), 
	t=c(1:50), lint=10, tit="Example", typeI="Disjoint")

#Example using objres as input. In this example X1 has no influence on the rate;
#consequently the fitted rate is almost a constant.

X1<-rnorm(1000)

modE<-fitPP.fun(tind=TRUE,covariates=cbind(X1), 
	posE=round(runif(40,1,1000)), inddat=rep(1,1000),
	tim=c(1:1000), tit="Simulated example", start=list(b0=1,b1=0),
	modCI=FALSE,modSim=TRUE,dplot=FALSE)

ResDE<-CalcResD.fun(mlePP=modE,lint=50)

graphrate.fun(ResDE, tit="Example")






