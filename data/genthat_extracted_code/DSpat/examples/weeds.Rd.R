library(DSpat)


### Name: weeds
### Title: Dubbo weed data
### Aliases: weeds
### Keywords: datasets

### ** Examples

## No test: 
###############################################################################
# Dubbo weed data
###############################################################################
#
# Example creates a function that you can run.  It is not run as
# part of the exampled to speed up package checking
# To run, code type do.weeds()
do.weeds=function()
{
  data(weeds.all)
  TrueAbundance=dim(weeds.all)[1]
  cat("\nTrue N= ",TrueAbundance,"\n")
  study.area=owin(xrange=c(0,1200),yrange=c(0,1200))
  data(weeds.lines)
  data(weeds.obs)
  data(weeds.covariates)
  study.area=owin(xrange=c(0,1200),yrange=c(0,1200))
#
# The entire study area is covered by the 8 N-S strips that are each 150m wide
# Sheep are absent on strips 1-4 and present on strips 5-8
# The following fits a model using all weeds whether they were seen or not
#
  weeds.dspat=dspat(int.formula=~factor(strip),det.formula=~-1,
                    study.area=study.area,
                    obs=weeds.all,lines=weeds.lines,covariates=weeds.covariates,
                    epsvu=c(100,1))
  mu.B <- integrate.intensity(weeds.dspat,dimyx=120,se=TRUE)
  cat('Abundance =       ', round(mu.B$abundance,0), "\n")
  pdf("TrueIntensity.pdf")
  plot(mu.B$lambda, main='True intensity by strip')
  plot(weeds.dspat$lines.psp,lty=2,add=TRUE)
  plot(owin(poly=weeds.dspat$transect),add=TRUE)
  plot(weeds.dspat$model$Q$data,add=TRUE,pch=20)
  dev.off()
# Compute distances for each weed
  obs.ppp=weeds.dspat$model$Q$data
  no.sheep.distances=NULL
  sheep.distances=NULL
  transects=weeds.dspat$transects
  for (i in 1:4)
    no.sheep.distances=c(no.sheep.distances,
      dist2line(obs.ppp[owin(poly=transects[i])],weeds.dspat$lines.psp$ends[i,])$distance)
  sheep.distances=NULL
  for (i in 5:8)
    sheep.distances=c(sheep.distances,
      dist2line(obs.ppp[owin(poly=transects[i])],weeds.dspat$lines.psp$ends[i,])$distance)
  pdf("True Distance Distribution.pdf")
  par(mfrow=c(2,1))
  hist(no.sheep.distances,breaks=(0:15)*5,main="Sheep absent",xlab="Perpendicular distance (m)")
  hist(sheep.distances,breaks=(0:15)*5,main="Sheep present",xlab="Perpendicular distance (m)")
  dev.off()
  no.sheep=hist(no.sheep.distances,breaks=(0:15)*5,plot=FALSE)$counts
  with.sheep=hist(sheep.distances,breaks=(0:15)*5,plot=FALSE)$counts
# summary of abundance per strip
  Est.N=by(mu.B$distribution$N,cut(mu.B$distribution$x,seq(0,1200,150)),sum)
  True.N=by(weeds.all$x,cut(weeds.all$x,seq(0,1200,150)),length)
  pdf("TrueAbundanceByStrip.pdf")
  barplot(rbind(True.N,Est.N),beside=TRUE,legend=TRUE,names.arg=1:8,main="All weeds")
  dev.off()
#  The following code will produce the true detection probability as a function of
#  distance for no sheep (lines 1-4) and sheep (lines 5-8) using all known weed locations
#  observed weed locations.
  sheep.labels.obs=cut(weeds.obs$label,c(1,4,8),include.lowest=TRUE)
  levels(sheep.labels.obs)=c("Sheep absent","Sheep present")
  sheep.labels=cut(weeds.all$label,c(1,4,8),include.lowest=TRUE)
  levels(sheep.labels)=c("Sheep absent","Sheep present")
  cat("\n All weeds \n")
  table(sheep.labels,cut(weeds.all$distance,(0:10)*7.5,include.lowest=TRUE))
  det=table(sheep.labels.obs,cut(weeds.obs$distance,(0:10)*7.5,include.lowest=TRUE))/
  table(sheep.labels,cut(weeds.all$distance,(0:10)*7.5,include.lowest=TRUE))
  cat("\n Detection \n")
  det
  pdf("TrueDetection.pdf")
  barplot(det,beside=TRUE,main="Dubbo weed detection probability",
             xlab="Perpendicular distance",legend=TRUE)
  dev.off()
#
# For the observed weeds with N-S transects:
#
# 6 different models were fit for each pairing of:
#  int.formula:
#  3 formulas for intensity: ~factor(sheep), ~factor(strip), ~s(x)
#  det.formula
#  2 formulas for detection: ~1 (constant sigma), ~factor(sheep) (sigma for sheep,no sheep)
#
# A half-normal detection function is assumed which is fitted with I(-distance^2/2)
#
# Fit model ~sheep, ~1
weeds.dspat.1=dspat(int.formula=~factor(sheep), study.area=study.area,
                     obs=weeds.obs,lines=weeds.lines,covariates=weeds.covariates,
                     epsvu=c(100,1))
AIC(weeds.dspat.1)
coef(weeds.dspat.1)
mu.B = integrate.intensity(weeds.dspat.1,dimyx=120,se=TRUE)
cat('Abundance =       ', round(mu.B$abundance,0), "\n")
cat('Standard Error =  ', round(mu.B$precision$se,0), "\n",
    '95 Percent Conf. Int. =   (', round(mu.B$precision$lcl.95,0), ',',
           round(mu.B$precision$ucl.95,0), ')', '\n')
pdf("NS_model_1_intensity.pdf")
plot(mu.B$lambda, main='Estimated Intensity')
plot(weeds.dspat.1$lines.psp,lty=2,add=TRUE)
plot(owin(poly=weeds.dspat.1$transect),add=TRUE)
plot(weeds.dspat.1$model$Q$data,add=TRUE,pch=20)
dev.off()
# Fit model ~sheep, ~sheep
weeds.dspat.2=dspat(int.formula=~factor(sheep),det.formula=~factor(sheep),
                   study.area=study.area,
                   obs=weeds.obs,lines=weeds.lines,covariates=weeds.covariates,
                   epsvu=c(100,1))
summary(weeds.dspat.2)
AIC(weeds.dspat.2)
coef(weeds.dspat.2)
mu.B = integrate.intensity(weeds.dspat.2,dimyx=120,se=TRUE)
cat('Abundance =       ', round(mu.B$abundance,0), "\n")
cat('Standard Error =  ', round(mu.B$precision$se,0), "\n",
    '95 Percent Conf. Int. =   (', round(mu.B$precision$lcl.95,0), ',',
           round(mu.B$precision$ucl.95,0), ')', '\n')
pdf("NS_model_2_intensity.pdf")
plot(mu.B$lambda, main='Estimated Intensity')
plot(weeds.dspat.2$lines.psp,lty=2,add=TRUE)
plot(owin(poly=weeds.dspat.2$transect),add=TRUE)
plot(weeds.dspat.2$model$Q$data,add=TRUE,pch=20)
dev.off()
# Fit model ~factor(strip), ~1
weeds.dspat.3=dspat(~factor(strip),study.area=study.area,
                  obs=weeds.obs,lines=weeds.lines,covariates=weeds.covariates,
                   epsvu=c(100,1))
summary(weeds.dspat.3)
AIC(weeds.dspat.3)
coef(weeds.dspat.3)
mu.B = integrate.intensity(weeds.dspat.3,dimyx=120,se=TRUE)
cat('Abundance =       ', round(mu.B$abundance,0), "\n")
cat('Standard Error =  ', round(mu.B$precision$se,0), "\n",
    '95 Percent Conf. Int. =   (', round(mu.B$precision$lcl.95,0), ',',
           round(mu.B$precision$ucl.95,0), ')', '\n')
pdf("NS_model_3_intensity.pdf")
plot(mu.B$lambda, main='Estimated Intensity')
plot(weeds.dspat.3$lines.psp,lty=2,add=TRUE)
plot(owin(poly=weeds.dspat.3$transect),add=TRUE)
plot(weeds.dspat.3$model$Q$data,add=TRUE,pch=20)
dev.off()
# Fit model ~factor(strip), ~factor(sheep)
weeds.dspat.4=dspat(int.formula=~factor(strip),det.formula=~factor(sheep),
                   study.area=study.area,
                   obs=weeds.obs,lines=weeds.lines,covariates=weeds.covariates,
                   epsvu=c(100,0.75),nclass=10)
summary(weeds.dspat.4)
AIC(weeds.dspat.4)
coef(weeds.dspat.4)
mu.B = integrate.intensity(weeds.dspat.4,dimyx=120,se=TRUE)
mu.B.4=mu.B
cat('Abundance =       ', round(mu.B$abundance,0), "\n")
cat('Standard Error =  ', round(mu.B$precision$se,0), "\n",
    '95 Percent Conf. Int. =   (', round(mu.B$precision$lcl.95,0), ',',
           round(mu.B$precision$ucl.95,0), ')', '\n')
pdf("NS_model_4_intensity.pdf")
plot(mu.B$lambda, main='Estimated Intensity')
plot(weeds.dspat.4$lines.psp,lty=2,add=TRUE)
plot(owin(poly=weeds.dspat.4$transect),add=TRUE)
plot(weeds.dspat.4$model$Q$data,add=TRUE,pch=20)
dev.off()
# Fit model ~s(x), ~1
weeds.dspat.5=dspat(int.formula=~s(x),
                    study.area=study.area,
                    obs=weeds.obs,lines=weeds.lines,covariates=weeds.covariates,
                    epsvu=c(100,1))
summary(weeds.dspat.5)
AIC(weeds.dspat.5)
coef(weeds.dspat.5)
mu.B = integrate.intensity(weeds.dspat.5,dimyx=120,se=TRUE)
cat('Abundance =       ', round(mu.B$abundance,0), "\n")
cat('Standard Error =  ', round(mu.B$precision$se,0), "\n",
    '95 Percent Conf. Int. =   (', round(mu.B$precision$lcl.95,0), ',',
           round(mu.B$precision$ucl.95,0), ')', '\n')
pdf("NS_model_5_intensity.pdf")
plot(mu.B$lambda, main='Estimated Intensity')
plot(weeds.dspat.5$lines.psp,lty=2,add=TRUE)
plot(owin(poly=weeds.dspat.5$transect),add=TRUE)
plot(weeds.dspat.5$model$Q$data,add=TRUE,pch=20)
dev.off()
# Fit model ~s(x), ~sheep
weeds.dspat.6=dspat(int.formula=~s(x),det.formula=~factor(sheep),
                    study.area=study.area,
                    obs=weeds.obs,lines=weeds.lines,covariates=weeds.covariates,
                    epsvu=c(100,1))

summary(weeds.dspat.6)
AIC(weeds.dspat.6)
coef(weeds.dspat.6)
mu.B = integrate.intensity(weeds.dspat.6,dimyx=120,se=TRUE)
cat('Abundance =       ', round(mu.B$abundance,0), "\n")
cat('Standard Error =  ', round(mu.B$precision$se,0), "\n",
    '95 Percent Conf. Int. =   (', round(mu.B$precision$lcl.95,0), ',',
           round(mu.B$precision$ucl.95,0), ')', '\n')
pdf("NS_model_6_intensity.pdf")
plot(mu.B$lambda, main='Estimated Intensity')
plot(weeds.dspat.6$lines.psp,lty=2,add=TRUE)
plot(owin(poly=weeds.dspat.6$transect),add=TRUE)
plot(weeds.dspat.6$model$Q$data,add=TRUE,pch=20)
dev.off()
# summary of abundance per strip using model 4
Est.N=by(mu.B.4$distribution$N,cut(mu.B.4$distribution$x,seq(0,1200,150)),sum)
True.N=by(weeds.all$x,cut(weeds.all$x,seq(0,1200,150)),length)
postscript("Figure3.ps",height=6,width=5,horizontal=FALSE)
barplot(rbind(True.N,Est.N),beside=TRUE,legend=TRUE,names.arg=1:8,main="N-S lines model 4")
dev.off()
# Show goodness of fit for sheep absent/present
postscript("Figure4.ps",height=6,width=5,horizontal=FALSE)
exp.nosheep=apply(weeds.dspat.4$exp.counts[1:4,],2,sum)
obs.nosheep=apply(weeds.dspat.4$obs.counts[1:4,],2,sum)
exp.sheep=apply(weeds.dspat.4$exp.counts[5:8,],2,sum)
obs.sheep=apply(weeds.dspat.4$obs.counts[5:8,],2,sum)
par(mfrow=c(2,1))
barplot(rbind(exp=exp.nosheep,obs=obs.nosheep),beside=TRUE,main="Sheep absent")
barplot(rbind(exp=exp.sheep,obs=obs.sheep),beside=TRUE,legend=FALSE,main="Sheep present")
dev.off()
# chi-square test for model 4
chisq=sum((exp.nosheep-obs.nosheep)^2/exp.nosheep)+
sum((exp.sheep-obs.sheep)^2/exp.sheep)
cat("Chi-square=",chisq," p= ",1-pchisq(chisq,2*10-length(weeds.dspat.4$par)),"\n")
# sigma for no sheep and sheep
sigmas=sqrt(1/coef(weeds.dspat.4)$detection)
cat("\n Sigma (no sheep) =",sigmas[1],"\n","Sigma (sheep)    =",sigmas[2],"\n")
###############################################################################
# Modify sampled vertical N-S strips to extend from 600 to 1200 and then
# add 4 E-W horizontal strips centered at 75,225,375,525. Using approximate
# detection functions for sheep/no sheep areas, a sample of observations from
# the points are randomly selected.
#
# NOTE: The following is random and will not produce the same results each time
# it is run because of the random observation process.
#
################################################################################
data(weeds.obs)
data(weeds.lines)
weeds.obs=weeds.obs[weeds.obs$y>600,]
xlines=data.frame(label=9:12,x0=rep(0,4),x1=rep(1200,4),y0=c(75,225,375,525),
                 y1=c(75,225,375,525),width=rep(149.999,4))
ls=lines_to_strips(xlines,study.area)
pts=ppp(x=weeds.all$x,y=weeds.all$y,window=study.area)
pdf("E-W_N-S samples.pdf")
plot(pts)
plot(ppp(x=weeds.obs$x,y=weeds.obs$y,window=study.area),add=TRUE,pch=19,col="red",cex=.5)
obs=sample.points(ls$transects,xlines,pts,detfct=hndetfct,
                det.par=c(3.637586,-.1466),det.formula=~factor(sheep),
                covariates=weeds.covariates)
weeds.obs=rbind(weeds.obs,obs)
plot(ppp(x=obs$x,y=obs$y,window=study.area),add=TRUE,pch=19,cex=.5)
dev.off()
weeds.lines[,"y0"]=600.0001
weeds.lines=rbind(weeds.lines,as.matrix(xlines))
weeds.dspat=dspat(int.formula=~factor(strip),det.formula=~factor(sheep),
                    study.area=study.area,
                    obs=weeds.obs,lines=weeds.lines,covariates=weeds.covariates,
                    epsvu=c(100,1),nclass=15)
coef(weeds.dspat)
# sigma for no sheep and sheep
sigmas=sqrt(1/coef(weeds.dspat)$detection)
cat("\n Sigma (no sheep) =",sigmas[1],"\n","Sigma (sheep)    =",sigmas[2],"\n")
mu.B <- integrate.intensity(weeds.dspat,dimyx=120,se=TRUE)
cat('Abundance =       ', round(mu.B$abundance,0), "\n")
cat('Standard Error =  ', round(mu.B$precision$se,0), "\n",
    '95 Percent Conf. Int. =   (', round(mu.B$precision$lcl.95,0), ',',
           round(mu.B$precision$ucl.95,0), ')', '\n')
pdf("E-W_N-S Estimated Intensity.pdf")
plot(mu.B$lambda, main='Estimated Intensity')
plot(weeds.dspat$lines.psp,lty=2,add=TRUE)
plot(owin(poly=weeds.dspat$transect),add=TRUE)
plot(weeds.dspat$model$Q$data,add=TRUE,pch=20)
dev.off()
# summary of abundance per strip
pdf("E-W_N-S AbundanceByStrip.pdf")
Est.N=by(mu.B$distribution$N,cut(mu.B$distribution$x,seq(0,1200,150)),sum)
True.N=by(weeds.all$x,cut(weeds.all$x,seq(0,1200,150)),length)
barplot(rbind(True.N,Est.N),beside=TRUE,legend=TRUE,names.arg=1:8,main="N-S and E-W lines")
dev.off()
# Show goodness of fit for sheep absent/present
pdf("GOF for NS_EW model.pdf")
exp.nosheep=apply(weeds.dspat$exp.counts[1:4,],2,sum)
obs.nosheep=apply(weeds.dspat$obs.counts[1:4,],2,sum)
exp.sheep=apply(weeds.dspat$exp.counts[5:8,],2,sum)
obs.sheep=apply(weeds.dspat$obs.counts[5:8,],2,sum)
par(mfrow=c(2,1))
barplot(rbind(exp=exp.nosheep,obs=obs.nosheep),beside=TRUE,legend=TRUE,main="Sheep absent")
barplot(rbind(exp=exp.sheep,obs=obs.sheep),beside=TRUE,legend=FALSE,main="Sheep present")
dev.off()
# chi-square test for model
chisq=sum((exp.nosheep-obs.nosheep)^2/exp.nosheep)+
sum((exp.sheep-obs.sheep)^2/exp.sheep)
cat("Chi-square=",chisq," p= ",1-pchisq(chisq,2*15-10),"\n")

###############################################################################
# Modify sampling such that all strips are E-W. Using approximate
# detection functions for sheep/no sheep areas derived from known data,
# a sample of observations from the points are randomly selected.
#
# NOTE: The following is random and will not produce the same results each time
# it is run because of the random observation process.
#
###############################################################################
xlines=data.frame(label=1:8,x0=rep(0,8),x1=rep(1200,8),y0=seq(75,1125,150),y1=seq(75,1125,150),
                       width=rep(149.999,8))
ls=lines_to_strips(xlines,study.area)
pts=ppp(x=weeds.all$x,y=weeds.all$y,window=study.area)
pdf("E-W samples.pdf")
plot(pts)
obs=sample.points(ls$transects,xlines,pts,detfct=hndetfct,
                det.par=c(3.637586,-.1466),det.formula=~factor(sheep),
                covariates=weeds.covariates)
plot(ppp(x=obs$x,y=obs$y,window=study.area),add=TRUE,pch=19,cex=.5)
dev.off()
weeds.dspat=dspat(int.formula=~factor(strip),det.formula=~factor(sheep),
                    study.area=study.area,
                    obs=obs,lines=xlines,covariates=weeds.covariates,
                    epsvu=c(100,1),nclass=15)
coef(weeds.dspat)
sigmas=sqrt(1/coef(weeds.dspat)$detection)
cat("\n Sigma (no sheep) =",sigmas[1],"\n","Sigma (sheep)    =",sigmas[2],"\n")
mu.B <- integrate.intensity(weeds.dspat,dimyx=120,se=TRUE)
cat('Abundance =       ', round(mu.B$abundance,0), "\n")
cat('Standard Error =  ', round(mu.B$precision$se,0), "\n",
    '95 Percent Conf. Int. =   (', round(mu.B$precision$lcl.95,0), ',',
           round(mu.B$precision$ucl.95,0), ')', '\n')
pdf("E-W Estimated Intensity.pdf")
plot(mu.B$lambda, main='Estimated Intensity')
plot(weeds.dspat$lines.psp,lty=2,add=TRUE)
plot(owin(poly=weeds.dspat$transect),add=TRUE)
plot(weeds.dspat$model$Q$data,add=TRUE,pch=20)
dev.off()
# summary of abundance per strip
Est.N=by(mu.B$distribution$N,cut(mu.B$distribution$x,seq(0,1200,150)),sum)
True.N=by(weeds.all$x,cut(weeds.all$x,seq(0,1200,150)),length)
pdf("E-W AbundanceByStrip.pdf")
barplot(rbind(True.N,Est.N),beside=TRUE,legend=TRUE,names.arg=1:8,main="E-W lines")
dev.off()
# Show goodness of fit for sheep absent/present
pdf("GOF for EW model.pdf")
exp.nosheep=apply(weeds.dspat$exp.counts[1:4,],2,sum)
obs.nosheep=apply(weeds.dspat$obs.counts[1:4,],2,sum)
exp.sheep=apply(weeds.dspat$exp.counts[5:8,],2,sum)
obs.sheep=apply(weeds.dspat$obs.counts[5:8,],2,sum)
par(mfrow=c(2,1))
barplot(rbind(exp=exp.nosheep,obs=obs.nosheep),beside=TRUE,legend=TRUE,main="Sheep absent")
barplot(rbind(exp=exp.sheep,obs=obs.sheep),beside=TRUE,legend=FALSE,main="Sheep present")
dev.off()
# chi-square test for model
chisq=sum((exp.nosheep-obs.nosheep)^2/exp.nosheep)+
sum((exp.sheep-obs.sheep)^2/exp.sheep)
cat("Chi-square=",chisq," p= ",1-pchisq(chisq,2*15-10),"\n")
}
## End(No test)



