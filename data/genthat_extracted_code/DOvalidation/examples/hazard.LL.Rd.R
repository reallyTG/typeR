library(DOvalidation)


### Name: hazard.LL
### Title: Local Linear Hazard Estimator (Natural Weighting)
### Aliases: hazard.LL
### Keywords: nonparametric survival

### ** Examples

## Calculation of the local linear hazard estimator with do-validated bandwidth.
## The hazard estimator is shown and decomposed into smoothed occurrences and exposures.
## This example is described in Gamiz et al. (2016).
data(UK)
Oi<-UK$D
Ei<-UK$E
ti<-40:110  # time is age and it goes from 40 to 110 years
M<-length(ti)
country<-'UK'
bdo<-5.11
resLL.do<-hazard.LL(xi=ti,Oi=Oi,Ei=Ei,x=ti,b=bdo,K="sextic",Ktype="symmetric",CI=TRUE)

## The local linear hazard estimate is hLL.do below
hLL.do<-resLL.do$hLL

## The smoothed occurrences and exposures are:
ELL.norm.do<-resLL.do$ELL.norm
OLL.norm.do<-resLL.do$OLL.norm

## The 95% pointwise confidence intervals based on the asymptotics are
hLL.do.inf<-resLL.do$CI.inf
hLL.do.sup<-resLL.do$CI.sup

# Now we plot the hazard estimator with confidence intervals
old.par<-par(mar=c(3,1.5,1.5,1.5),oma=c(2,0.5,0.5,0.2),
mgp=c(1.5,0.5,0),cex.axis=1,cex.main=1.5,mfrow=c(3,2))

#hazard estimate
tit<-paste(country,"Hazard estimate",sep= ' - ' )
yy<-range(c(hLL.do.inf,hLL.do.sup),na.rm=TRUE)
plot(ti,hLL.do,main=tit,xlab='age',ylab='',type='l',lwd=2,ylim=yy)
# the confidence bands
x1<-ti;x2<-ti[M:1]   
y1<-hLL.do.sup;y2<-hLL.do.inf[M:1]       
polygon(c(x1,x2,x1[1]),c(y1,y2,y1[1]),col=gray(0.7),border=FALSE)
lines(ti,hLL.do,lty=1,lwd=2,col=1)
  
## Zooming at the old mortality
ind.ages<- -c(1:60)  ## only women with ages 100 or higher
ti2<-ti[ind.ages];M2<-length(ti2)
yy2<-range(c(hLL.do.inf[ind.ages],hLL.do.sup[ind.ages]),na.rm=TRUE)
plot(ti2,hLL.do[ind.ages],main=tit,xlab='age',ylab='',type='l',
lwd=2,ylim=yy2)
# the confidence intervals
x1<-ti2;x2<-ti2[M2:1]   
y1<-hLL.do.sup[ind.ages];hLL.do.inf2<-hLL.do.inf[ind.ages]
y2<-hLL.do.inf2[M2:1]       
polygon(c(x1,x2,x1[1]),c(y1,y2,y1[1]),col=gray(0.7),border=FALSE)
lines(ti2,hLL.do[ind.ages],lty=1,lwd=2,col=1)
  
## We decompose the estimator in the smooth occurrences and exposures
#   The occurrences with a zoom at old-age mortality
yy<-range(OLL.norm.do,na.rm=TRUE)
plot(ti,OLL.norm.do,main="Smoothed occurrences",xlab='age',ylab='',type='l',
lwd=2,ylim=yy)
yy2<-range(OLL.norm.do[ind.ages],na.rm=TRUE)
plot(ti2,OLL.norm.do[ind.ages],main="Smoothed occurrences",xlab='age',
ylab='',type='l',lwd=2,ylim=yy2)
  
#   The exposures with a zoom at old-age mortality
yy<-range(ELL.norm.do,na.rm=TRUE)
plot(ti,ELL.norm.do,main="Smoothed exposures",xlab='age',ylab='',type='l',
lwd=2,ylim=yy)
yy2<-range(ELL.norm.do[ind.ages],na.rm=TRUE)
plot(ti2,ELL.norm.do[ind.ages],main="Smoothed exposures",xlab='age',ylab='',
type='l',lwd=2,ylim=yy2)

# Revert the changes made in the graphics options
par(old.par)




