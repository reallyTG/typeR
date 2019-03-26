library(ptw)


### Name: calc.zerocoef
### Title: Correction for warping coefficients when using zeropadding
### Aliases: calc.zerocoef
### Keywords: manip

### ** Examples

data(gaschrom)
gaschrom.zf <- padzeros(gaschrom, 250)
ref <- gaschrom[1,]
samp <- gaschrom[16,]
ref.zf <- gaschrom.zf[1,]
samp.zf <- gaschrom.zf[16,]
gaschrom.ptw <- ptw(ref.zf, samp.zf)
layout(matrix(1:2,2,1, byrow=TRUE))
plot(gaschrom.ptw)
corr.coef <- calc.zerocoef(gaschrom.ptw$warp.coef, 250)
gaschrom.ptw2 <- ptw(ref, samp, init.coef = corr.coef, try = TRUE)
plot(gaschrom.ptw2)



