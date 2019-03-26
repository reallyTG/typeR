library(hmmm)


### Name: hidden.emfit
### Title: ML estimation of a multinomial hidden Markov model
### Aliases: hidden.emfit
### Keywords: models

### ** Examples
data(drinks)
y<-cbind(drinks$lemon.tea,drinks$orange.juice)
fm<-c("l-l-l")
fmargobs<-marg.list(fm)
#initial values of transition matrix and obs distribution given the two latent states
Ptr<-matrix(c(0.941, 0.199,0.059, 0.801),2,2,byrow=TRUE)
Ptobs<-matrix(c(0.053, 0.215, 0.206, 0.001, 0.039, 0.021, 0.020, 0.176, 0.270,
                0.000, 0.000, 0.000, 0.048, 0.263, 0.360, 0.065, 0.053, 0.211),
2,9,byrow=TRUE)
find<-~lat+lat*tea+lat*juice   # lat is the latent variable
model.obsf<-hmmm.model(marg=fmargobs,
lev=c(2,3,3),names=c("lat","tea","juice"),formula=find)

# model of independent observed variables given the latent states
modelind<-hidden.emfit(y,model.obsf,y.eps=0.01,maxit=10,maxiter=2500,
old.tran.p=Ptr,bb=Ptobs)
print(modelind,printflag=TRUE)

#alternative definition based on hmmm.model.X
f<-list(tea=~tea*lat,juice=~juice*lat,tea.juice="zero")
model.obsfX<-hmmm.model.X(marg=marg.list(c("l-l")),names=c("tea","juice"),
fnames=c("lat"),lev=c(3,3),strata=c(2))
modelindX<-hidden.emfit(y,model.obsfX,y.eps=0.01,maxit=10,maxiter=2500,
old.tran.p=Ptr,bb=Ptobs)
modelindX
summary(modelindX)



