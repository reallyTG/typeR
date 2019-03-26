library(NHPoisson)


### Name: CalcRes.fun
### Title: NHPP residuals on overlapping intervals
### Aliases: CalcRes.fun

### ** Examples


X1<-rnorm(1000)
X2<-rnorm(1000)

modE<-fitPP.fun(tind=TRUE,covariates=cbind(X1,X2), 
	posE=round(runif(40,1,1000)), inddat=rep(1,1000),
	tim=c(1:1000), tit="Simulated example",start=list(b0=1,b1=0,b2=0),
	dplot=FALSE,modCI=FALSE,modSim=TRUE)


#Residuals, based on overlapping intervals of length 50, from the fitted NHPP modE  

ResE<-CalcRes.fun(mlePP=modE, lint=50)





