library(fda.usc)


### Name: flm.test
### Title: Goodness-of-fit test for the Functional Linear Model with scalar
###   response
### Aliases: flm.test
### Keywords: htest models regression

### ** Examples


# Simulated example #

X=rproc2fdata(n=100,t=seq(0,1,l=101),sigma="OU")
beta0=fdata(mdata=cos(2*pi*seq(0,1,l=101))-(seq(0,1,l=101)-0.5)^2+
rnorm(101,sd=0.05),argvals=seq(0,1,l=101),rangeval=c(0,1))
Y=inprod.fdata(X,beta0)+rnorm(100,sd=0.1)

dev.new(width=21,height=7)
par(mfrow=c(1,3))
plot(X,main="X")
plot(beta0,main="beta0")
plot(density(Y),main="Density of Y",xlab="Y",ylab="Density")
rug(Y)

## Not run: 
##D # Composite hypothesis: do not reject FLM
##D pcvm.sim=flm.test(X,Y,B=50,B.plot=50,G=100,plot.it=TRUE)
##D pcvm.sim
##D flm.test(X,Y,B=5000)
##D 
##D # Estimated beta
##D dev.new()
##D plot(pcvm.sim$beta.est)
##D 
##D # Simple hypothesis: do not reject beta=beta0
##D flm.test(X,Y,beta0.fdata=beta0,B=50,B.plot=50,G=100)
##D flm.test(X,Y,beta0.fdata=beta0,B=5000) 
##D 
##D 
##D # AEMET dataset #
##D 
##D data(aemet)
##D 
##D # Remove the 5% of the curves with less depth (i.e. 4 curves)
##D dev.new()
##D res.FM=depth.FM(aemet$temp,draw=TRUE)
##D qu=quantile(res.FM$dep,prob=0.05)
##D l=which(res.FM$dep<=qu)
##D lines(aemet$temp[l],col=3)
##D aemet$df$name[l]
##D 
##D # Data without outliers 
##D wind.speed=apply(aemet$wind.speed$data,1,mean)[-l]
##D temp=aemet$temp[-l]
##D 
##D # Exploratory analysis: accept the FLM
##D pcvm.aemet=flm.test(temp,wind.speed,est.method="pls",B=100,B.plot=50,G=100)
##D pcvm.aemet
##D 
##D # Estimated beta
##D dev.new()
##D plot(pcvm.aemet$beta.est,lwd=2,col=2)
##D 
##D # B=5000 for more precision on calibration of the test: also accept the FLM
##D flm.test(temp,wind.speed,est.method="pls",B=5000) 
##D 
##D # Simple hypothesis: rejection of beta0=0? Limiting p-value...
##D dat=rep(0,length(temp$argvals))
##D flm.test(temp,wind.speed, beta0.fdata=fdata(mdata=dat,argvals=temp$argvals,
##D rangeval=temp$rangeval),B=100)
##D flm.test(temp,wind.speed, beta0.fdata=fdata(mdata=dat,argvals=temp$argvals,
##D rangeval=temp$rangeval),B=5000) 
##D 
##D 
##D # Tecator dataset #
##D 
##D data(tecator)
##D names(tecator)
##D absorp=tecator$absorp.fdata
##D ind=1:129 # or ind=1:215
##D x=absorp[ind,]
##D y=tecator$y$Fat[ind]
##D tt=absorp[["argvals"]]
##D 
##D # Exploratory analysis for composite hypothesis with automatic choose of p
##D pcvm.tecat=flm.test(x,y,B=100,B.plot=50,G=100)
##D pcvm.tecat
##D 
##D # B=5000 for more precision on calibration of the test: also reject the FLM
##D flm.test(x,y,B=5000) 
##D 
##D # Distribution of the PCvM statistic
##D plot(density(pcvm.tecat$boot.statistics),lwd=2,xlim=c(0,10),
##D main="PCvM distribution", xlab="PCvM*",ylab="Density")
##D rug(pcvm.tecat$boot.statistics)
##D abline(v=pcvm.tecat$statistic,col=2,lwd=2)
##D legend("top",legend=c("PCvM observed"),lwd=2,col=2)
##D 
##D # Simple hypothesis: fixed p
##D dat=rep(0,length(x$argvals))
##D flm.test(x,y,beta0.fdata=fdata(mdata=dat,argvals=x$argvals,
##D rangeval=x$rangeval),B=100,p=11)
##D 
##D # Simple hypothesis, automatic choose of p
##D flm.test(x,y,beta0.fdata=fdata(mdata=dat,argvals=x$argvals,
##D rangeval=x$rangeval),B=100)
##D flm.test(x,y,beta0.fdata=fdata(mdata=dat,argvals=x$argvals,
##D rangeval=x$rangeval),B=5000) 
## End(Not run)



