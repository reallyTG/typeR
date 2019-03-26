### R code from vignette source 'Tides.Rnw'

###################################################
### code chunk number 1: Tides.Rnw:18-19
###################################################
require(Tides)


###################################################
### code chunk number 2: TideFig1
###################################################

plot(waterlevels$time,waterlevels$h,ylab="water level [cmTAW]", xlab="time", type="l", cex.lab=1.5, cex.axis=1.5, lwd=2) # changed units to cm TAW instead of mTAW
lines(waterlevels$time,waterlevels$h0,col="grey")




###################################################
### code chunk number 3: TideFig2
###################################################

TCwl <- TidalCharacteristics(waterlevels)
N1 <- 5
N2 <- 12
date1 <- TCwl$h$time[match(N1,TCwl$h$N)]
date2 <- TCwl$h$time[match(N2+1,TCwl$h$N)]
wssub <- subset(waterlevels,time>date1&time<date2)
HLsub <- subset(TCwl$HL,time>date1&time<date2)
Hsub <- subset(HLsub,HL=="H")
# as.POSIXct(diff(Hsub$time))
plot(TCwl$h$time,TCwl$h$h,ylab="water level [cmTAW]", xlab="time", 
     type="l",xlim=c(date1,date2),ylim=c(280,360),axes=F, 
     cex.lab=1.5, cex.axis=1.5, lwd=2) # cm!
axis(2)
days <- as.POSIXct(strptime(paste("2007-03-",1:31),format="%F"))
axis.POSIXct(1,waterlevels$time,format="%a",at=days)
box()

hH <- subset(TCwl$h,HL=="H")
points(hH$time,hH$h,col="blue",pch=20)

T2 <- 5*60*60
pt <- wssub[95,]
pt1 <- data.frame(time=0,h=0)
pt1$time <- pt$time-T2
pt1$h <- approx(wssub$time,wssub$h,xout=pt1$time)$y
pt2 <- data.frame(time=0,h=0)
pt2$time <- pt$time+T2
pt2$h <- approx(wssub$time,wssub$h,xout=pt2$time)$y
points(c(pt1$time,pt$time,pt2$time),c(pt1$h,pt$h,pt2$h),pch=20,type="b")
text(c(pt1$time,pt$time-60*60,pt2$time+2*60*60),c(pt1$h-5,pt$h,pt2$h),c("h(t-T/2)","h(t)","h(t+T/2)"))



###################################################
### code chunk number 4: TideFig3
###################################################

plot(TidalCharacteristics(waterlevels, hoffset=3), cex.lab=1.5, cex.axis=1.5, lwd=2)



