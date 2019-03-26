library(funHDDC)


### Name: funHDDC
### Title: Clustering univariate and multivariate functional data in
###   group-specific functional subspaces
### Aliases: funHDDC

### ** Examples



##Univariate example
data("trigo")
basis<- create.bspline.basis(c(0,1), nbasis=25)
var1<-smooth.basis(argvals=seq(0,1,length.out = 100),y=t(trigo[,1:100]),fdParobj=basis)$fd

res.uni<-funHDDC(var1,K=2,model="AkBkQkDk",init="kmeans",threshold=0.2)
plot(var1,col=res.uni$class)


##Multivariate example
data("triangle")
basis<- create.bspline.basis(c(1,21), nbasis=25)
var1<-smooth.basis(argvals=seq(1,21,length.out = 101),y=t(triangle[,1:101]),fdParobj=basis)$fd
var2<-smooth.basis(argvals=seq(1,21,length.out = 101),y=t(triangle[,102:202]),fdParobj=basis)$fd

res.multi<-funHDDC(list(var1,var2),K=3,model="AkjBkQkDk",init="kmeans",threshold=0.2)
par(mfrow=c(1,2))
plot(var1,col=res.multi$class)
plot(var2,col=res.multi$class)


##NOT RUN:
##You can test multiple number of groups at the same time
#data("trigo")
#basis<- create.bspline.basis(c(0,1), nbasis=25)
#var1<-smooth.basis(argvals=seq(0,1,length.out = 100),y=t(trigo[,1:100]),fdParobj=basis)$fd
#res.uni<-funHDDC(var1,K=2:4,model="AkBkQkDk",init="kmeans",threshold=0.2)

##You can test multiple models at the same time
#data("trigo")
#basis<- create.bspline.basis(c(0,1), nbasis=25)
#var1<-smooth.basis(argvals=seq(0,1,length.out = 100),y=t(trigo[,1:100]),fdParobj=basis)$fd
#res.uni<-funHDDC(var1,K=3,model=c("AkjBkQkDk","AkBkQkDk"),init="kmeans",threshold=0.2)


##another example on Canadian data

###Clustering the "Canadian temperature" data (Ramsey & Silverman): univariate case
#daybasis65 <- create.fourier.basis(c(0, 365), nbasis=65, period=365)
#daytempfd <- smooth.basis(day.5, CanadianWeather$dailyAv[,,"Temperature.C"], daybasis65,
#    fdnames=list("Day", "Station", "Deg C"))$fd

#res.uni<-funHDDC(daytempfd,K=3,model="AkjBkQkDk",init="random",threshold=0.2)

##Graphical representation of groups mean curves
#select1<-fd(daytempfd$coefs[,which(res.uni$class==1)],daytempfd$basis)
#select2<-fd(daytempfd$coefs[,which(res.uni$class==2)],daytempfd$basis)
#select3<-fd(daytempfd$coefs[,which(res.uni$class==3)],daytempfd$basis)

#plot(mean.fd(select1),col="lightblue",ylim=c(-20,20),lty=1,lwd=3)
#lines(mean.fd(select2),col="palegreen2",lty=1,lwd=3)
#lines(mean.fd(select3),col="navy",lty=1,lwd=3)


###Clustering the "Canadian temperature" data (Ramsey & Silverman): multivariate case
#daybasis65 <- create.fourier.basis(c(0, 365), nbasis=65, period=365)
#daytempfd <- smooth.basis(day.5, CanadianWeather$dailyAv[,,"Temperature.C"], daybasis65,
#    fdnames=list("Day", "Station", "Deg C"))$fd
#dayprecfd<-smooth.basis(day.5, CanadianWeather$dailyAv[,,"Precipitation.mm"], daybasis65,
#    fdnames=list("Day", "Station", "Mm"))$fd

#res.multi<-funHDDC(list(daytempfd,dayprecfd),K=3,model="AkjBkQkDk",init="random",threshold=0.2)

##Graphical representation of groups mean curves
##Temperature
#select1<-fd(daytempfd$coefs[,which(res.multi$class==1)],daytempfd$basis)
#select2<-fd(daytempfd$coefs[,which(res.multi$class==2)],daytempfd$basis)
#select3<-fd(daytempfd$coefs[,which(res.multi$class==3)],daytempfd$basis)

#plot(mean.fd(select1),col="lightblue",ylim=c(-20,20),lty=1,lwd=3)
#lines(mean.fd(select2),col="palegreen2",lty=1,lwd=3)
#lines(mean.fd(select3),col="navy",lty=1,lwd=3)

##Precipitation
#select1b<-fd(dayprecfd$coefs[,which(res.multi$class==1)],dayprecfd$basis)
#select2b<-fd(dayprecfd$coefs[,which(res.multi$class==2)],dayprecfd$basis)
#select3b<-fd(dayprecfd$coefs[,which(res.multi$class==3)],dayprecfd$basis)

#plot(mean.fd(select1b),col="lightblue",ylim=c(0,5),lty=1,lwd=3)
#lines(mean.fd(select2b),col="palegreen2",lty=1,lwd=3)
#lines(mean.fd(select3b),col="navy",lty=1,lwd=3)





