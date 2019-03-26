library(NHPoisson)


### Name: resQQplot.fun
### Title: QQplot of the residuals of a NHPP
### Aliases: resQQplot.fun resSim.fun

### ** Examples


X1<-rnorm(500)
X2<-rnorm(500)

aux<-fitPP.fun(tind=TRUE,covariates=cbind(X1,X2), 
	posE=round(runif(40,1,500)), inddat=rep(1,500),
	tim=c(1:500), tit="Simulated example", start=list(b0=1,b1=0,b2=0),dplot=FALSE)

auxRes<-CalcResD.fun(mlePP=aux,lint=50)


#if we want reproducible results, we can fixed the seed in the generation process
#(the number of cores used in the calculations must also be the same to reproduce
# the result)

auxqq<-resQQplot.fun(nsim=50,objres=auxRes, covariates=cbind(X1,X2), fixed.seed=123)




