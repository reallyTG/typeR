library(SynchWave)


### Name: synsq_cwt_fw
### Title: Synchrosqueezing Transform
### Aliases: synsq_cwt_fw
### Keywords: nonparametric

### ** Examples

tt <- seq(0, 10, , 1024)
nv <- 32
f0 <- (1+0.6*cos(2*tt))*cos(4*pi*tt+1.2*tt^2)
sigma <- 0.5
f <- f0 + sigma*rnorm(length(tt))

# Continuous wavelet transform
opt <- list(type = "bump")
cwtfit <- cwt_fw(f, opt$type, nv, tt[2]-tt[1], opt)

# Hard thresholing
thresh <- est_riskshrink_thresh(cwtfit$Wx, nv)
cwtfit$Wx[which(abs(cwtfit$Wx) < thresh)] <- 0.0

# Reconstruction
opt$gamma <- thresh
#[1] 0.0593984
#opt$gamma <- 10^-5
cwtrec <- cwt_iw(cwtfit$Wx, opt$type, opt)

par(mfrow=c(1,1))
plot(tt, f, type="p", lty=2, xlab="time", ylab="f", col="red", cex=0.1)
lines(tt, f0, col="blue")
lines(tt, cwtrec)

# Synchrosqueezed wavelet transform
sstfit <- synsq_cwt_fw(tt, f, nv, opt)

#par(mfrow=c(2,2))
#plot(tt, f, type="p", lty=2, xlab="time", ylab="f", col="red", cex=0.1)
#lines(tt, f0, col="blue")

#image.plot(list(x=tt, y=sstfit$asc, z=t(abs(sstfit$Wx))), log="y", 
#    xlab="Time", ylab="Scale", main="Time-Scale Representation by CWT",  
#    col=designer.colors(64, c("azure", "cyan", "blue", "darkblue")), ylim=rev(range(sstfit$asc)))
#image.plot(list(x=tt, y=sstfit$fs, z=t(abs(sstfit$Tx))), log="y", 
#    xlab="Time", ylab="Frequency", main="Time-Frequency Representation by SST", 
#    col=designer.colors(64, c("azure", "cyan", "blue", "darkblue")), ylim=c(0.5, 25))
#image.plot(list(x=tt, y=sstfit$asc, z=t(sstfit$w)), log="y", 
#    xlab="Time", ylab="Scale", main="Instantaneous Frequency",  
#    col=designer.colors(64, c("azure", "cyan", "blue", "darkblue")), ylim=rev(range(sstfit$asc)))



