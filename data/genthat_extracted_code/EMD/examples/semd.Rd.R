library(EMD)


### Name: semd
### Title: Statistical Empirical Mode Decomposition
### Aliases: semd
### Keywords: nonparametric

### ** Examples

ndata <- 2048
tt <- seq(0, 9, length=ndata)                 
xt <- sin(pi * tt) + sin(2* pi * tt) + sin(6 * pi * tt)  + 0.5 * tt 
set.seed(1)
xt <- xt + rnorm(ndata, 0, sd(xt)/5)

## Not run: 
##D ### Empirical Mode Decomposition by Interpolation
##D emdbyint <- emd(xt, tt, max.imf = 5, boundary = "wave")
##D ### Empirical Mode Decomposition by Smoothing
##D emdbysm <- semd(xt, tt, cv.kfold=4, boundary="wave", smlevels=1, max.imf=5)
##D 
##D par(mfcol=c(6,2), mar=c(2,2,2,1), oma=c(0,0,2,0))                              
##D rangext <- range(xt); rangeimf <- rangext - mean(rangext)
##D plot(tt, xt, xlab="", ylab="", main="signal", ylim=rangext, type="l")
##D mtext("Decomposition by EMD", side = 3, line = 2, cex=0.85, font=2)
##D plot(tt, emdbyint$imf[,1], xlab="", ylab="", main="imf 1", ylim=rangeimf,  type="l")
##D abline(h=0, lty=2)
##D plot(tt, emdbyint$imf[,2], xlab="", ylab="", main="imf 2", ylim=rangeimf,  type="l")
##D abline(h=0, lty=2)
##D plot(tt, emdbyint$imf[,3], xlab="", ylab="", main="imf 3", ylim=rangeimf,  type="l")
##D abline(h=0, lty=2)
##D plot(tt, emdbyint$imf[,4], xlab="", ylab="", main="imf 4", ylim=rangeimf,  type="l")
##D abline(h=0, lty=2)
##D plot(tt, emdbyint$imf[,5]+emdbyint$residue, xlab="", ylab="", main="remaining signal",
##D     ylim=rangext, type="l")
##D 
##D plot(tt, xt, xlab="", ylab="", main="signal", ylim=rangext, type="l")
##D mtext("Decomposition by SEMD", side = 3, line = 2, cex=0.85, font=2)
##D plot(tt, emdbysm$imf[,1], xlab="", ylab="", main="noise", ylim=rangeimf,  type="l")
##D abline(h=0, lty=2)
##D plot(tt, emdbysm$imf[,2], xlab="", ylab="", main="imf 1", ylim=rangeimf,  type="l")
##D abline(h=0, lty=2)
##D plot(tt, emdbysm$imf[,3], xlab="", ylab="", main="imf 2", ylim=rangeimf,  type="l")
##D abline(h=0, lty=2)
##D plot(tt, emdbysm$imf[,4], xlab="", ylab="", main="imf 3", ylim=rangeimf,  type="l")
##D abline(h=0, lty=2)
##D plot(tt, emdbysm$residue, xlab="", ylab="", main="residue", ylim=rangext, type="l")
## End(Not run)



