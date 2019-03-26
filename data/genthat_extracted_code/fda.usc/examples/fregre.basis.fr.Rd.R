library(fda.usc)


### Name: fregre.basis.fr
### Title: Functional Regression with functional response using basis
###   representation.
### Aliases: fregre.basis.fr
### Keywords: regression

### ** Examples


## Not run: 
##D rtt<-c(0, 365)
##D basis.alpha  <- create.constant.basis(rtt)
##D basisx  <- create.bspline.basis(rtt,11)
##D basisy  <- create.bspline.basis(rtt,11)
##D basiss  <- create.bspline.basis(rtt,7)
##D basist  <- create.bspline.basis(rtt,9)
##D 
##D # fd class
##D dayfd<-Data2fd(day.5,CanadianWeather$dailyAv,basisx)
##D tempfd<-dayfd[,1]
##D log10precfd<-dayfd[,3]
##D res1 <-  fregre.basis.fr(tempfd, log10precfd,
##D basis.s=basiss,basis.t=basist)
##D 
##D # fdata class
##D tt<-1:365
##D tempfdata<-fdata(t(CanadianWeather$dailyAv[,,1]),tt,rtt)
##D log10precfdata<-fdata(t(CanadianWeather$dailyAv[,,3]),tt,rtt)
##D res2<-fregre.basis.fr(tempfdata,log10precfdata,
##D basis.s=basiss,basis.t=basist)
##D 
##D # penalization
##D Lfdobjt <- Lfdobjs <- vec2Lfd(c(0,0), rtt)
##D Lfdobjt <- vec2Lfd(c(0,0), rtt)
##D lambdat<-lambdas <- 100
##D res1.pen <- fregre.basis.fr(tempfdata,log10precfdata,basis.s=basiss,
##D basis.t=basist,lambda.s=lambdas,lambda.t=lambdat,
##D Lfdobj.s=Lfdobjs,Lfdobj.t=Lfdobjt)
##D 
##D res2.pen <- fregre.basis.fr(tempfd, log10precfd,
##D basis.s=basiss,basis.t=basist,lambda.s=lambdas,
##D lambda.t=lambdat,Lfdobj.s=Lfdobjs,Lfdobj.t=Lfdobjt)
##D 
##D plot(log10precfd,col=1)
##D lines(res1$fitted.values,col=2)
##D plot(res1$residuals)
##D plot.bifd(res1$beta.est,tt,tt)
##D plot.bifd(res1$beta.est,tt,tt,type="persp",theta=45,phi=30)
## End(Not run)




