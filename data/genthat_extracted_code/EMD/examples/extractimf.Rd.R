library(EMD)


### Name: extractimf
### Title: Intrinsic Mode Function
### Aliases: extractimf
### Keywords: nonparametric

### ** Examples

### Generating a signal
ndata <- 3000
par(mfrow=c(1,1), mar=c(1,1,1,1))
tt2 <- seq(0, 9, length=ndata)
xt2 <- sin(pi * tt2) + sin(2* pi * tt2) + sin(6 * pi * tt2)  + 0.5 * tt2
plot(tt2, xt2, xlab="", ylab="", type="l", axes=FALSE); box()

### Extracting the first IMF by sifting process
tryimf <- extractimf(xt2, tt2, check=FALSE)



