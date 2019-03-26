### R code from vignette source 'npmlreg-v.Rtex'

###################################################
### code chunk number 1: npmlreg-v.Rtex:177-181
###################################################
data(galaxies, package="MASS")
galaxies[78]<-26960
gal<-as.data.frame(galaxies)
rm(galaxies)


###################################################
### code chunk number 2: npmlreg-v.Rtex:188-190
###################################################
gal$v1000<- gal$galaxies/1000
gal$v1000


###################################################
### code chunk number 3: npmlreg-v.Rtex:196-197
###################################################
library(npmlreg)


###################################################
### code chunk number 4: npmlreg-v.Rtex:202-203
###################################################
glm(v1000~1,data=gal)


###################################################
### code chunk number 5: npmlreg-v.Rtex:207-208
###################################################
(galaxy.np1 <- alldist(v1000~1,random=~1,random.distribution='np',k=1,data=gal))


###################################################
### code chunk number 6: npmlreg-v.Rtex:222-223
###################################################
galaxy.np1$dev


###################################################
### code chunk number 7: npmlreg-v.Rtex:230-233
###################################################
(galaxy.np2 <- alldist(v1000~1,random=~1,random.distribution='np',k=2,data=gal))
(galaxy.np3 <- alldist(v1000~1,random=~1,random.distribution='np',k=3,data=gal))
(galaxy.np4 <- alldist(v1000~1,random=~1,random.distribution='np',k=4,data=gal))


###################################################
### code chunk number 8: npmlreg-v.Rtex:243-244
###################################################
plot(galaxy.np4, plot.opt=3)


###################################################
### code chunk number 9: npmlreg-v.Rtex:252-257
###################################################
(galaxy.np5 <- alldist(v1000~1,random=~1,k=5,data=gal, verbose=FALSE))$disp
(galaxy.np6 <- alldist(v1000~1,random=~1,k=6,tol=0.2,data=gal,verbose=FALSE))$disp
(galaxy.np7 <- alldist(v1000~1,random=~1,k=7,tol=0.12,data=gal,verbose=FALSE))$disp
(galaxy.np8 <- alldist(v1000~1,random=~1,k=8,tol=0.2,data=gal,verbose=FALSE))$disp
(galaxy.np9 <- alldist(v1000~1,random=~1,k=9,tol=0.06,data=gal,verbose=FALSE))$disp


###################################################
### code chunk number 10: npmlreg-v.Rtex:283-284
###################################################
summary(galaxy.np4u <- alldist(v1000~1, random=~1, k=4, tol=0.5, data=gal, lambda=1, verbose=FALSE))


###################################################
### code chunk number 11: npmlreg-v.Rtex:290-291 (eval = FALSE)
###################################################
## plot(galaxy.np4u, plot.opt=15, height=5)


###################################################
### code chunk number 12: npmlreg-v.Rtex:307-308
###################################################
plot(galaxy.np4u, plot.opt=15)


###################################################
### code chunk number 13: npmlreg-v.Rtex:339-341
###################################################
(galaxy.np8us <- alldist(v1000~1, random=~1, k=8, tol=0.5, data=gal, lambda=1, verbose=FALSE, spike.protect=TRUE))
galaxy.np8us$sdev$sdevk


###################################################
### code chunk number 14: npmlreg-v.Rtex:352-354
###################################################
(galaxy.np8ud <- alldist(v1000~1, random=~1, k=8, tol=0.5, data=gal, lambda=0.99))
galaxy.np8ud$sdev$sdevk


###################################################
### code chunk number 15: npmlreg-v.Rtex:365-367
###################################################
par(mfrow=c(1,1), cex=0.65)
tolfind(v1000~1, random=~1, k=8, data=gal, lambda=1, find.in.range=c(0.0,0.6), steps=12, plot.opt=0, verbose=FALSE, noformat=TRUE)[c(3,4)]


###################################################
### code chunk number 16: npmlreg-v.Rtex:380-383
###################################################
data(fabric)
(faults0 <- glm(y ~ 1, family=poisson(link=log),data=fabric))
(faults1 <- glm(y ~ x, family=poisson(link=log),data=fabric)) 


###################################################
### code chunk number 17: npmlreg-v.Rtex:402-405
###################################################
(faults.g1<- alldist(y ~ x, family=poisson(link=log), random=~1, data= fabric,k=1, random.distribution="gq")) 
(faults.g2<- alldist(y ~ x, family=poisson(link=log), random=~1, data= fabric,k=2, random.distribution="gq")) 
(faults.g3<- alldist(y ~ x, family=poisson(link=log), random=~1, data= fabric,k=3, random.distribution="gq",verbose=F)) 


###################################################
### code chunk number 18: npmlreg-v.Rtex:409-410
###################################################
faults.g1$dev


###################################################
### code chunk number 19: npmlreg-v.Rtex:418-420
###################################################
(faults.np2<- alldist(y ~ x, family=poisson(link=log), random=~1, data= fabric,k=2, random.distribution="np")) 
(faults.np3<- alldist(y ~ x, family=poisson(link=log), random=~1, data= fabric,k=3, random.distribution="np",verbose=FALSE)) 


###################################################
### code chunk number 20: npmlreg-v.Rtex:429-430
###################################################
predict(faults.g2, type="response",newdata=fabric[1:6,])


###################################################
### code chunk number 21: npmlreg-v.Rtex:434-435
###################################################
predict(faults.g2, type="response")[1:6]


###################################################
### code chunk number 22: npmlreg-v.Rtex:448-451
###################################################
data(rainfall)
rainfall$x<-rainfall$Rain/1000  
rainfall$x2<- rainfall$x^2; rainfall$x3<- rainfall$x^3


###################################################
### code chunk number 23: npmlreg-v.Rtex:458-459
###################################################
 (toxo.np<- alldist(cbind(Cases,Total-Cases)~1, random=~1, data=rainfall, k=3, family=binomial(link=logit)))


###################################################
### code chunk number 24: npmlreg-v.Rtex:463-464
###################################################
 toxo.np$disparity


###################################################
### code chunk number 25: npmlreg-v.Rtex:471-472
###################################################
 (toxo.npx<- alldist(cbind(Cases,Total-Cases)~x, random=~1, data=rainfall, k=3, family=binomial(link=logit)))


###################################################
### code chunk number 26: npmlreg-v.Rtex:477-478
###################################################
 (toxo.npxx<- alldist(cbind(Cases,Total-Cases)~x, random=~x, data=rainfall, k=3, family=binomial(link=logit)))


###################################################
### code chunk number 27: npmlreg-v.Rtex:485-486
###################################################
  round(t(toxo.np$post.prob),digits=2)


###################################################
### code chunk number 28: npmlreg-v.Rtex:496-498
###################################################
round(toxo.ebp<-toxo.np$ebp,digits=3)
round(exp(toxo.ebp)/(1+exp(toxo.ebp)),digits=4)


###################################################
### code chunk number 29: npmlreg-v.Rtex:502-503
###################################################
predict(toxo.np, type="response")


###################################################
### code chunk number 30: npmlreg-v.Rtex:506-507
###################################################
fitted(toxo.np)


###################################################
### code chunk number 31: npmlreg-v.Rtex:512-513
###################################################
predict(toxo.npx,type="response",newdata=data.frame(x=2))


###################################################
### code chunk number 32: npmlreg-v.Rtex:527-529
###################################################
data(hosp)
(fitnp3<-  alldist(duration~age+temp1, data=hosp,k=3, family=Gamma(link=log),tol=0.2)) 


###################################################
### code chunk number 33: npmlreg-v.Rtex:533-534
###################################################
 fitnp3$shape


###################################################
### code chunk number 34: npmlreg-v.Rtex:540-541
###################################################
 (fitnp3e<-  alldist(duration~age+temp1, data=hosp,k=3, family=Gamma(link=log),tol=0.2,shape=1))


###################################################
### code chunk number 35: npmlreg-v.Rtex:580-584
###################################################
 data(Oxboys, package = "nlme")
 Oxboys$boy <- gl(26,9) 
 plot(Oxboys$age[Oxboys$boy==1],Oxboys$height[Oxboys$boy==1],ylim=c(125,175),type='b',pch=1,xlab='age',ylab='height')
 for (i in 2:nlevels(Oxboys$Subject)){lines(Oxboys$age[Oxboys$boy==i],Oxboys$height[Oxboys$boy==i], pch=1,type='b',col=i)}


###################################################
### code chunk number 36: npmlreg-v.Rtex:596-597
###################################################
 (Oxboys.g20 <- allvc(height~age,random=~1|boy,data=Oxboys,random.distribution='gq',k=20))


###################################################
### code chunk number 37: npmlreg-v.Rtex:605-606
###################################################
Oxboys.g20$rsdev^2/(Oxboys.g20$rsdev^2+ Oxboys.g20$sdev$sdev^2)


###################################################
### code chunk number 38: npmlreg-v.Rtex:610-612
###################################################
 (Oxboys.np7 <- allvc(height~age,random=~1|boy,data=Oxboys,random.distribution='np',k=7))
 (Oxboys.np8 <- allvc(height~age,random=~1|boy,data=Oxboys,random.distribution='np',k=8)) 


###################################################
### code chunk number 39: npmlreg-v.Rtex:620-621
###################################################
 plot(Oxboys.np8, plot.opt=2)


###################################################
### code chunk number 40: npmlreg-v.Rtex:627-628
###################################################
 (Oxboys.np8s <- allvc(height~age,random=~age|boy,data=Oxboys,random.distribution='np',k=8))


###################################################
### code chunk number 41: npmlreg-v.Rtex:632-633
###################################################
  Oxboys.np8$disp-Oxboys.np8s$disp


###################################################
### code chunk number 42: npmlreg-v.Rtex:640-641
###################################################
 plot(Oxboys.np8, plot.opt=2)


###################################################
### code chunk number 43: npmlreg-v.Rtex:655-656
###################################################
 data(irlsuicide)


###################################################
### code chunk number 44: npmlreg-v.Rtex:674-675
###################################################
citation(package="npmlreg")


###################################################
### code chunk number 45: npmlreg-v.Rtex:754-755
###################################################
ls("package:npmlreg")


