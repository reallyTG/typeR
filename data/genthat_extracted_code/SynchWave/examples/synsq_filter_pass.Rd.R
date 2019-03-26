library(SynchWave)


### Name: synsq_filter_pass
### Title: Filtering of the Synchrosqueezing Representation
### Aliases: synsq_filter_pass
### Keywords: nonparametric

### ** Examples

set.seed(7)
n <- 2048
tu <- seq(0,10,, n)
dt <- tu[2]-tu[1]

feq1 <- function(t) (1+0.2*cos(t))*cos(2*pi*(2*t+0.3*cos(t)))
feq2 <- function(t) (1+0.3*cos(2*t))*exp(-t/15)*cos(2*pi*(2.4*t+0.5*t^(1.2)+0.3*sin(t)))
feq3 <- function(t) cos(2*pi*(5.3*t-0.2*t^(1.3)))
feq <- function(t) feq1(t) + feq2(t) + feq3(t)
s2 <- 2.4
noise <- sqrt(s2)*rnorm(length(tu))

fu0 <- feq(tu);
fu <- fu0 + noise;
fus <- cbind(feq1(tu), feq2(tu), feq3(tu))

# Continuous wavelet transform
nv <- 32
opt <- list(type = "bump")

cwtfit <- cwt_fw(fu, opt$type, nv, dt, opt)
thresh <- est_riskshrink_thresh(cwtfit$Wx, nv)

# Hard thresholding and Reconstruction
cwtfit$Wx[which(abs(cwtfit$Wx) < thresh)] <- 0.0
fur <- cwt_iw(cwtfit$Wx, opt$type, opt)

# Synchrosqueezed wavelet transform using denoised signal
sstfit <- synsq_cwt_fw(tu, fur, nv, opt)

#par(mfrow=c(2,2))
#image.plot(list(x=tu, y=sstfit$asc, z=t(abs(sstfit$Wx))), log="y", 
#    xlab="Time", ylab="Scale", main="Time-Scale Representation by CWT",  
#    col=designer.colors(64, c("azure", "cyan", "blue", "darkblue")), ylim=c(1, 0.0625)) 

# Extracting the second component by filtering of continuous wavelet transform
am <- 0.2 * rep(1, length(tu))
aM <- 0.3 * rep(1, length(tu))

#lines(tu, am, col="red", lty=3, lwd=2)
#lines(tu, aM, col="red", lty=3, lwd=2)

tmp <- synsq_filter_pass(sstfit$Wx, sstfit$asc, am, aM);
furcwt <- cwt_iw(tmp$Txf, opt$type, opt);

#image.plot(list(x=tu, y=sstfit$fs, z=t(abs(sstfit$Tx))), log="y",
#    xlab="Time", ylab="Frequency", main="Time-Frequency Representation by SST", 
#    col=designer.colors(64, c("azure", "cyan", "blue", "darkblue")), ylim=c(1, 8))

# Extracting the second component by filtering of synchrosqueezed wavelet transform
fm <- fM <- (2.4+0.5*1.2*tu^0.2+0.3*cos(tu))

#lines(tu, 0.88*fm, col="red", lty=3, lwd=2)
#lines(tu, 1.22*fM, col="red", lty=3, lwd=2)

tmp <- synsq_filter_pass(sstfit$Tx, sstfit$fs, 0.88*fm, 1.12*fM);
fursst <- synsq_cwt_iw(tmp$Txf, w, opt);

#plot(tu, fursst, type="l", main="SST", xlab="time", ylab="f", col="red",
#    xlim=c(1.5,8.5), ylim=c(-1,1))
#lines(tu, feq2(tu), col="blue")

#plot(tu, furcwt, type="l", main="CWT", xlab="time", ylab="f", col="red", 
#    xlim=c(1.5,8.5), ylim=c(-1,1))
#lines(tu, feq2(tu), col="blue")

# Remove all energy for normalized frequencies above 1.
# synsq_filter_pass(Tx, fs, -Inf, 1) 



