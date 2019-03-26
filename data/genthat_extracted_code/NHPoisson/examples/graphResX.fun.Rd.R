library(NHPoisson)


### Name: graphResX.fun
### Title: Lurking variable plot
### Aliases: graphResX.fun

### ** Examples


##Simulated process not related to variable X
##Plots dividing the  variable into  50 levels

X1<-rnorm(500)
X2<-rnorm(500)
auxmlePP<-fitPP.fun(posE=round(runif(50,1,500)), inddat=rep(1,500),
	covariates=cbind(X1,X2),start=list(b0=1,b1=0,b2=0))



##Raw residuals
res<-graphResX.fun(X=rnorm(500),nint=50,mlePP=auxmlePP,typeRes="Raw")

##Pearson residuals
res<-graphResX.fun(X=rnorm(500),nint=50,mlePP=auxmlePP,typeRes="Pearson")





