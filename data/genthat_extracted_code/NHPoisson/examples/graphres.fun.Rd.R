library(NHPoisson)


### Name: graphres.fun
### Title: Plot of the NHPP residuals
### Aliases: graphres.fun

### ** Examples


#Example using objres as input

X1<-c(1:1000)**0.5

modE<-fitPP.fun(tind=TRUE,covariates=cbind(X1), 
	posE=round(runif(40,1,1000)), inddat=rep(1,1000),
	tim=c(1:1000), tit="Simulated example", start=list(b0=1,b1=0),
	modSim = TRUE, dplot = FALSE)

ResDE<-CalcResD.fun(mlePP=modE,lint=50)
graphres.fun(objres=ResDE, typeRes="Raw", Xvariables=cbind(X1),
	namXv=c("X1"), plotDisp=c(2,1), addlow=TRUE,tit="Example")


#Example using the set of arguments res, t and fittedlambda as input
#In this case, with typeI="Disjoint", only values of t, fittedlambda and Xvariables 
#in the midpoint of the intervals must be provided.

#Since   a 1X1 layout is  specified in plotDisp and only one  
#graphical device is opened by default, the two  resulting plots can be scrolled  
#up and down  with the "Page Up" and "Page Down" keys.

X1<-c(1:500)**0.5
graphres.fun(res=rnorm(50),posE=round(runif(50,1,500)),
	fittedlambda=runif(500,0,1)[seq(5,495,10)],
	t=seq(5,495,10), typeRes="Raw", typeI="Disjoint",Xvariables=X1[seq(5,495,10)],
	namXv=c("X1"), plotDisp=c(1,1), tit="Example 2",lint=10)



