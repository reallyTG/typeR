library(FRegSigCom)


### Name: step.ff.interaction
### Title: Stepwise variable selection procedure for FOF regression models
###   with two-way interactions
### Aliases: step.ff.interaction

### ** Examples


library(FRegSigCom)
data(ocean)

Y=ocean$Salinity
X=list()
X[[1]]=ocean$Potential.density
X[[2]]=ocean$Temperature
X[[3]]=ocean$Oxygen
n.curves=length(X)
ntot=dim(Y)[1]
ntrain=50
ntest=ntot-ntrain
X.uncent=X
for(i in 1:n.curves){
  X[[i]]=scale(X.uncent[[i]],center=TRUE, scale=FALSE)
}
lengthX=dim(X[[1]])[2]
lengthY=dim(Y)[2]
t.x=seq(0,1,length=lengthX)
t.y=seq(0,1,length=lengthY)
I.train=sample(1:ntot, ntrain)
X.train=list()
X.test=list()
t.x.all=list()
for(j in 1:n.curves){
  X.train[[j]]=X[[j]][I.train,]
  X.test[[j]]=X[[j]][-I.train,]
  t.x.all[[j]]=t.x
}
Y.train=Y[I.train, ]
Y.test=Y[-I.train, ]


###############################
#model selection
###############################

fit.step=step.ff.interaction(X.train, Y.train, t.x.all, t.y)
Y.pred=pred.ff.interaction(fit.step,  X.test)
error.selected=mean((Y.pred-Y.test)^2)
print(c("error.selected=", error.selected))
#coef.obj=getcoef.ff.interaction(fit.step)
#str(coef.obj)



