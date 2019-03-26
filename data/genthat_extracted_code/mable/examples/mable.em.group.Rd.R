library(mable)


### Name: mable.em.group
### Title: Fit grouped data with the Bernstein polynomial model with a
###   given degree m
### Aliases: mable.em.group
### Keywords: ~distribution ~models ~nonparametric ~smooth

### ** Examples

# Chicken Embryo Data
data(chicken.embryo)
a<-0; b<-21
t<-((a:b)-a)/(b-a)
day<-chicken.embryo$day
nT<-chicken.embryo$nT
Day<-rep(day,nT)
res<-mable.em.group(x=nT, t, m=13)
phat<-res$phat; mhat<-13
xx<-seq(0,1,len=100)
fb<-bern.approx(x=xx, p=phat)/(b-a)
fk<-density(x=rep((0:20)+.5, nT), bw="sj", n=101, from=a, to=b)
hist(Day, breaks=seq(a,b,  length=12), freq=FALSE,
         main="Histogram and Density Estimates")
lines(a+(b-a)*xx, fb, lty=2, col=2)
lines(fk, lty=3, col=3)
legend(14, .2, lty=1:3, c("Histogram", "MABLE", "Kernel"),  
                           bty="n", col=1:3)



