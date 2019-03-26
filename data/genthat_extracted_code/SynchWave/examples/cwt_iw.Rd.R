library(SynchWave)


### Name: cwt_iw
### Title: Inverse Wavelet Transform
### Aliases: cwt_iw
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
cwtrec <- cwt_iw(cwtfit$Wx, opt$type, opt)

par(mfrow=c(1,1))
plot(tt, f, type="p", lty=2, xlab="time", ylab="f", col="red", cex=0.1)
lines(tt, f0, col="blue")
lines(tt, cwtrec)



