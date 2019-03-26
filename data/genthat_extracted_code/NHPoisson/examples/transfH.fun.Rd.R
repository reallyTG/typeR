library(NHPoisson)


### Name: transfH.fun
### Title: Transforming a NHPP into a HPP
### Aliases: transfH.fun

### ** Examples


X1<-rnorm(500)
X2<-rnorm(500)
auxmlePP<-fitPP.fun(posE=round(runif(50,1,500)), inddat=rep(1,500),
	covariates=cbind(X1,X2),start=list(b0=1,b1=0,b2=0))


posEH<-transfH.fun(auxmlePP)



