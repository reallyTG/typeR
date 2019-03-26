library(multitaper)


### Name: demod.dpss
### Title: Computes complex demodulates using multiple taper techniques
### Aliases: demod.dpss
### Keywords: math

### ** Examples

data(CETmonthly)
nJulOff <- 1175
xd <- ts(CETmonthly[,"temp"],deltat=1/12)
demodYr <- demod.dpss(xd,centreFreq=1,nw=3,blockLen=120,stepSize=1)
phase <- demodYr$phase
offsJul <- 3*360/365 
phaseAdj <- phase
phaseAdj[1:nJulOff] <- phase[1:nJulOff] + offsJul
yr <- (time(xd)+1658)[1:length(phase)]
plot(yr, phaseAdj, type="l", lwd=2,
     ylab="Phase of the Year in Degrees",
     xlab="Gegorian calender date")
lines((1:nJulOff)/12+1659, phase[1:nJulOff], col="red")
fit <- lm( phaseAdj ~ yr)
abline(fit, lty=2, col="blue")
cat(paste("Precession Estimate: ",fit$coef[2]*60*60,digits=6," (arcseconds/yr)\n",sep=""))



