library(FSA)


### Name: growthModels
### Title: Creates a function for a specific parameterization of the von
###   Bertalanffy, Gompertz, Richards, and logistic growth functions.
### Aliases: growthModels vbFuns GompertzFuns RichardsFuns logisticFuns
###   growthFunShow
### Keywords: hplot manip

### ** Examples

###########################################################
## Simple Examples -- Von B
( vb1 <- vbFuns() )
ages <- 0:20
plot(vb1(ages,Linf=20,K=0.3,t0=-0.2)~ages,type="b",pch=19)
( vb2 <- vbFuns("Francis") )
plot(vb2(ages,L1=10,L2=19,L3=20,t1=2,t3=18)~ages,type="b",pch=19)
( vb2c <- vbFuns("Francis",simple=TRUE) )   # compare to vb2

## Simple Examples -- Gompertz
( gomp1 <- GompertzFuns() )
plot(gomp1(ages,Linf=800,gi=0.5,ti=5)~ages,type="b",pch=19)
( gomp2 <- GompertzFuns("Ricker2") )
plot(gomp2(ages,L0=2,a=6,gi=0.5)~ages,type="b",pch=19)
( gomp2c <- GompertzFuns("Ricker2",simple=TRUE) )   # compare to gomp2
( gompT <- GompertzFuns("Troynikov1"))

## Simple Examples -- Richards
( rich1 <- RichardsFuns() )
plot(rich1(ages,Linf=800,k=0.5,a=1,b=6)~ages,type="b",pch=19)
( rich2 <- RichardsFuns(2) )
plot(rich2(ages,Linf=800,k=0.5,ti=3,b=6)~ages,type="b",pch=19)
( rich3 <- RichardsFuns(3) )
plot(rich3(ages,Linf=800,k=0.5,ti=3,b=0.15)~ages,type="b",pch=19)
( rich4 <- RichardsFuns(4) )
plot(rich4(ages,Linf=800,k=0.5,ti=3,b=0.95)~ages,type="b",pch=19)
lines(rich4(ages,Linf=800,k=0.5,ti=3,b=1.5)~ages,type="b",pch=19,col="blue")
( rich5 <- RichardsFuns(5) )
plot(rich5(ages,Linf=800,k=0.5,L0=50,b=1.5)~ages,type="b",pch=19)
( rich6 <- RichardsFuns(6) )
plot(rich6(ages,Linf=800,k=0.5,ti=3,Lninf=50,b=1.5)~ages,type="b",pch=19)
( rich2c <- RichardsFuns(2,simple=TRUE) ) # compare to rich2

## Simple Examples -- Logistic
( log1 <- logisticFuns() )
plot(log1(ages,Linf=800,gninf=0.5,ti=5)~ages,type="b",pch=19)
( log2 <- logisticFuns("CJ2") )
plot(log2(ages,Linf=800,gninf=0.5,a=10)~ages,type="b",pch=19)
( log2c <- logisticFuns("CJ2",simple=TRUE) ) # compare to log2
( log3 <- logisticFuns("Karkach") )
plot(log3(ages,L0=10,Linf=800,gninf=0.5)~ages,type="b",pch=19)
( log4 <- logisticFuns("Haddon") )


###########################################################
## Examples of fitting
##   After the last example a plot is constructed with three
##   or four lines on top of each other illustrating that the
##   parameterizations all produce the same fitted values.
##   However, observe the correlations in the summary() results.

## Von B
plot(tl~age,data=SpotVA1,pch=19)

# Fitting the typical parameterization of the von B function
fit1 <- nls(tl~vb1(age,Linf,K,t0),data=SpotVA1,
            start=vbStarts(tl~age,data=SpotVA1))
summary(fit1,correlation=TRUE)
curve(vb1(x,Linf=coef(fit1)),from=0,to=5,col="red",lwd=10,add=TRUE)

# Fitting the Francis parameterization of the von B function
fit2 <- nls(tl~vb2c(age,L1,L2,L3,t1=0,t3=5),data=SpotVA1,
            start=vbStarts(tl~age,data=SpotVA1,type="Francis",ages2use=c(0,5)))
summary(fit2,correlation=TRUE)
curve(vb2c(x,L1=coef(fit2)[1],L2=coef(fit2)[2],L3=coef(fit2)[3],t1=0,t3=5),
      from=0,to=5,col="blue",lwd=5,add=TRUE)

# Fitting the Schnute parameterization of the von B function
vb3 <- vbFuns("Schnute")
fit3 <- nls(tl~vb3(age,L1,L3,K,t1=0,t3=4),data=SpotVA1,
            start=vbStarts(tl~age,data=SpotVA1,type="Schnute",ages2use=c(0,4)))
summary(fit3,correlation=TRUE)
curve(vb3(x,L1=coef(fit3),t1=c(0,4)),from=0,to=5,col="green",lwd=2,add=TRUE)

## Gompertz
# Make some fake data using the original parameterization
gompO <- GompertzFuns("original")
# setup ages, sample sizes (general reduction in numbers with
# increasing age), and additive SD to model
t <- 1:15
n <- c(10,40,35,25,12,10,10,8,6,5,3,3,3,2,2)
sd <- 15
# expand ages
ages <- rep(t,n)
# get lengths from gompertz and a random error for individuals
lens <- gompO(ages,Linf=450,a=1,gi=0.3)+rnorm(length(ages),0,sd)
# put together as a data.frame
df <- data.frame(age=ages,len=round(lens,0))

plot(len~age,data=df,pch=19,col=rgb(0,0,0,1/5))
  
# Fit first Ricker parameterization
fit1 <- nls(len~gomp1(age,Linf,gi,ti),data=df,start=list(Linf=500,gi=0.3,ti=3))
summary(fit1,correlation=TRUE)
curve(gomp1(x,Linf=coef(fit1)),from=0,to=15,col="red",lwd=10,add=TRUE)

# Fit third Ricker parameterization
fit2 <- nls(len~gomp2(age,L0,a,gi),data=df,start=list(L0=30,a=3,gi=0.3))
summary(fit2,correlation=TRUE)
curve(gomp2(x,L0=coef(fit2)),from=0,to=15,col="blue",lwd=5,add=TRUE)

# Fit third Quinn and Deriso parameterization (using simple=TRUE model)
gomp3 <- GompertzFuns("QD3",simple=TRUE)
fit3 <- nls(len~gomp3(age,Linf,gi,t0),data=df,start=list(Linf=500,gi=0.3,t0=0))
summary(fit3,correlation=TRUE)
curve(gomp3(x,Linf=coef(fit3)[1],gi=coef(fit3)[2],t0=coef(fit3)[3]),
      from=0,to=15,col="green",lwd=2,add=TRUE)

## Richards

## Not run: 
##D # Fit first Richards parameterization ... DOES NOT CONVERGE
##D fit1 <- nls(len~rich1(age,Linf,k,a,b),data=df,
##D             start=list(Linf=450,k=0.3,a=0.2,b=3))
##D summary(fit1,correlation=TRUE)
##D curve(rich1(x,Linf=coef(fit1)),from=0,to=15,col="red",lwd=10,add=TRUE)
##D 
##D # Fit second Richards parameterization ... DOES NOT CONVERGE
##D fit2 <- nls(len~rich2(age,Linf,k,ti,b),data=df,
##D             start=list(Linf=450,k=0.25,ti=3,b=3))
##D summary(fit2,correlation=TRUE)
##D curve(rich2(x,Linf=coef(fit2)),from=0,to=15,col="blue",lwd=7,add=TRUE)
## End(Not run)

plot(len~age,data=df,pch=19,col=rgb(0,0,0,1/5))

# Fit third Richards parameterization
fit3 <- nls(len~rich3(age,Linf,k,ti,b),data=df,
            start=list(Linf=450,k=0.25,ti=3,b=-0.1))
summary(fit3,correlation=TRUE)
curve(rich3(x,Linf=coef(fit3)),from=0,to=15,col="green",lwd=4,add=TRUE)

# Fit fourth Richards parameterization
fit4 <- nls(len~rich4(age,Linf,k,ti,b),data=df,
            start=list(Linf=450,k=0.25,ti=3,b=0.7))
summary(fit4,correlation=TRUE)
curve(rich4(x,Linf=coef(fit4)),from=0,to=15,col="black",lwd=1,add=TRUE)

## Logistic
plot(len~age,data=df,pch=19,col=rgb(0,0,0,1/5))

# Fit first Campana-Jones parameterization
fit1 <- nls(len~log1(age,Linf,gninf,ti),data=df,
            start=list(Linf=450,gninf=0.45,ti=4))
summary(fit1,correlation=TRUE)
curve(log1(x,Linf=coef(fit1)),from=0,to=15,col="red",lwd=10,add=TRUE)

# Fit second Campana-Jones parameterization
fit2 <- nls(len~log2(age,Linf,gninf,a),data=df,
            start=list(Linf=450,gninf=0.45,a=7))
summary(fit2,correlation=TRUE)
curve(log2(x,Linf=coef(fit2)),from=0,to=15,col="blue",lwd=5,add=TRUE)

# Fit Karkach parameterization (using simple=TRUE model)
log3 <- logisticFuns("Karkach",simple=TRUE)
fit3 <- nls(len~log3(age,Linf,L0,gninf),data=df,
            start=list(Linf=450,L0=30,gninf=0.45))
summary(fit3,correlation=TRUE)
curve(log3(x,Linf=coef(fit3)[1],L0=coef(fit3)[2],gninf=coef(fit3)[3]),
      from=0,to=15,col="green",lwd=2,add=TRUE)


#############################################################################
## Create expressions of the models
#############################################################################
# Typical von Bertalanffy ... Show as a stand-alone plot
growthFunShow("vonBertalanffy","Typical",plot=TRUE)
# Get and save the expression
( tmp <- growthFunShow("vonBertalanffy","Typical") )
# Use expression as title on a plot
lens <- vb1(ages,Linf=20,K=0.3,t0=-0.2)
plot(lens~ages,type="b",pch=19,main=tmp)
# Put expression in the main plot
text(10,5,tmp)
# Put multiple expressions on a plot
op <- par(mar=c(0.1,0.1,0.1,0.1))
plot(0,type="n",xlab="",ylab="",xlim=c(0,1),ylim=c(0,3),xaxt="n",yaxt="n")
text(0,2.5,"Original:",pos=4)
text(0.5,2.5,growthFunShow("vonBertalanffy","Original"))
text(0,1.5,"Typical:",pos=4)
text(0.5,1.5,growthFunShow("vonBertalanffy","Typical"))
text(0,0.5,"Francis:",pos=4)
text(0.5,0.5,growthFunShow("vonBertalanffy","Francis"))
par(op)



