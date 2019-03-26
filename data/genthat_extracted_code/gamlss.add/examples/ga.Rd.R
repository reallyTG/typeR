library(gamlss.add)


### Name: ga
### Title: A interface functions to use Simon Wood's gam() and bam()
###   functions within GAMLSS
### Aliases: ga ga.control ba ba.control
### Keywords: regression

### ** Examples

library(mgcv)
data(rent)
#---------------------------------------------------------
## normal errors one x-variable
ga1 <- gam(R~s(Fl, bs="ps", k=20), data=rent, method="REML")
gn1 <- gamlss(R~ga(~s(Fl, bs="ps", k=20), method="REML"), data=rent) # additive
gb1 <- gamlss(R~pb(Fl), data=rent) # additive
AIC(ga1,gn1, gb1, k=0)
AIC(ga1,gn1, gb1)
#--------------------------------------------------------
## normal error additive in Fl and A
ga2 <- gam(R~s(Fl)+s(A), method="REML", data=rent)
gn2 <- gamlss(R~ga(~s(Fl)+s(A), method="REML"),  data=rent) # additive
gb2 <- gamlss(R~pb(Fl)+pb(A), data=rent) # additive
AIC(ga2,gn2, gb2, k=0)
AIC(ga2,gn2, gb2)
#---------------------------------------------------------
## Not run: 
##D ## gamma error additive in Fl and A
##D ga3 <- gam(R~s(Fl)+s(A), method="REML", data=rent, family=Gamma(log))
##D gn3 <- gamlss(R~ga(~s(Fl)+s(A), method="REML"), data=rent, family=GA)# additive
##D gb3 <- gamlss(R~pb(Fl)+pb(A), data=rent, family=GA) # additive
##D AIC(ga3,gn3, gb3, k=0)
##D AIC(ga3,gn3, gb3)
##D #---------------------------------------------------------
##D ## gamma error surface fitting
##D ga4 <-gam(R~s(Fl,A), method="REML", data=rent, family=Gamma(log))
##D gn4 <- gamlss(R~ga(~s(Fl,A), method="REML"), data=rent, family=GA) 
##D AIC(ga4,gn4, k=0)
##D AIC(ga4,gn4)
##D ## plot the fitted surfaces
##D op<-par(mfrow=c(1,2))
##D vis.gam(ga4)
##D vis.gam(getSmo(gn4))
##D par(op)
##D ## contour plot using mgcv's plot() function
##D plot(getSmo(gn4))
##D #---------------------------------------------------------
##D ## predict
##D newrent <- data.frame(expand.grid(Fl=seq(30,120,5), A=seq(1890,1990,5 )))
##D newrent1 <-newrent2 <- newrent
##D newrent1$pred <- predict(ga4, newdata=newrent, type="response")
##D newrent2$pred <- predict(gn4, newdata=newrent, type="response")
##D library(lattice)
##D wf1<-wireframe(pred~Fl*A, newrent1, aspect=c(1,0.5), drape=TRUE, 
##D              colorkey=(list(space="right", height=0.6)), main="gam()")
##D wf2<-wireframe(pred~Fl*A, newrent2, aspect=c(1,0.5), drape=TRUE, 
##D           colorkey=(list(space="right", height=0.6)), main="gamlss()")
##D print(wf1, split=c(1,1,2,1), more=TRUE)
##D print(wf2, split=c(2,1,2,1))
##D #---------------------------------------------------------
##D ##gamma error two variables te() function
##D ga5 <-  gam(R~te(Fl,A), data=rent, family=Gamma(log))
##D gn5 <- gamlss(R~ga(~te(Fl,A)), data=rent, family=GA) 
##D AIC(ga5,gn5)
##D AIC(ga5,gn5, k=0)
##D op<-par(mfrow=c(1,2))
##D vis.gam(ga5)
##D vis.gam(getSmo(gn5))
##D par(op)
##D #----------------------------------------------------------
##D ## use of Markov random fields 
##D ## example from package mgcv of Simon Wood
##D ## Load Columbus Ohio crime data (see ?columbus for details and credits)
##D data(columb)       ## data frame
##D data(columb.polys) ## district shapes list
##D xt <- list(polys=columb.polys) ## neighbourhood structure info for MRF
##D ## First a full rank MRF...
##D b <- gam(crime ~ s(district,bs="mrf",xt=xt),data=columb,method="REML")
##D bb <- gamlss(crime~ ga(~s(district,bs="mrf",xt=xt), method="REML"), data=columb)
##D AIC(b,bb, k=0)
##D op<-par(mfrow=c(2,2))
##D plot(b,scheme=1)
##D plot(bb$mu.coefSmo[[1]], scheme=1)
##D ## Compare to reduced rank version...
##D b <- gam(crime ~ s(district,bs="mrf",k=20,xt=xt),data=columb,method="REML")
##D bb <- gamlss(crime~ ga(~s(district,bs="mrf",k=20,xt=xt), method="REML"), 
##D              data=columb)
##D AIC(b,bb, k=0)
##D plot(b,scheme=1)
##D plot(bb$mu.coefSmo[[1]], scheme=1)
##D par(op)
##D ## An important covariate added...
##D b <- gam(crime ~ s(district,bs="mrf",k=20,xt=xt)+s(income),
##D          data=columb,method="REML")
##D ## x in gam() 
##D bb <- gamlss(crime~ ga(~s(district,bs="mrf",k=20,xt=xt)+s(income), 
##D              method="REML"), data=columb)
##D ## x in gamlss()
##D bbb <- gamlss(crime~ ga(~s(district,bs="mrf",k=20,xt=xt), 
##D              method="REML")+pb(income), data=columb)
##D AIC(b,bb,bbb)
##D ## ploting the fitted models
##D op<-par(mfrow=c(2,2))
##D plot(b,scheme=c(0,1))
##D plot(getSmo(bb), scheme=c(0,1))
##D par(op)
##D plot(getSmo(bbb, which=2))
##D ## plot fitted values by district
##D op<- par(mfrow=c(1,2))
##D fv <- fitted(b)
##D names(fv) <- as.character(columb$district)
##D fv1 <- fitted(bbb)
##D names(fv1) <- as.character(columb$district)
##D polys.plot(columb.polys,fv)
##D polys.plot(columb.polys,fv1)
##D par(op)
## End(Not run)
## bam 



