library(SynchWave)


### Name: curve_ext_multi
### Title: Extract a Maximum Energy / Minimum Curvature Curves
### Aliases: curve_ext_multi
### Keywords: nonparametric

### ** Examples

set.seed(7)
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

# Denoised signal
opt$gamma <- thresh
fr <- cwt_iw(cwtfit$Wx, opt$type, opt)

# Synchrosqueezed wavelet transform using denoised signal
sstfit2 <- synsq_cwt_fw(tt, fr, nv, opt)

# Ridge extraction
lambda <- 1e+04
nw <- 16
imtfit <- curve_ext_multi(sstfit2$Tx, log2(sstfit2$fs), 1, lambda, nw)

# Reconstruction
curvefit <- curve_ext_recon(sstfit2$Tx, sstfit2$fs, imtfit$Cs, opt, nw)

par(mfrow=c(2,1))
image.plot(list(x=tt, y=sstfit2$fs, z=t(abs(sstfit2$Tx))), log="y", 
    xlab="Time", ylab="Frequency", main="Time-Frequency Representation by SST", 
    col=designer.colors(64, c("azure", "cyan", "blue", "darkblue")), ylim=c(0.5, 25))
lines(tt, sstfit2$fs[imtfit$Cs[,1]], col="red", lty=3, lwd=2)

plot(tt, f0, type="l")
lines(tt, curvefit, lty=2)



