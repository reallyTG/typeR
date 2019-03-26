library(oce)


### Name: makeFilter
### Title: Make a digital filter
### Aliases: makeFilter

### ** Examples


library(oce)

# 1. Demonstrate step-function response
y <- c(rep(1, 10), rep(-1, 10))
x <- seq_along(y)
plot(x, y, type='o', ylim=c(-1.05, 1.05))
BH <- makeFilter("blackman-harris", 11, asKernel=FALSE)
H <- makeFilter("hamming", 11, asKernel=FALSE)
yBH <- stats::filter(y, BH)
points(x, yBH, col=2, type='o')
yH <- stats::filter(y, H)
points(yH, col=3, type='o')
legend("topright", col=1:3, cex=2/3, pch=1,
       legend=c("input", "Blackman Harris", "Hamming"))

# 2. Show theoretical and practical filter gain, where
#    the latter is based on random white noise, and
#    includes a particular value for the spans
#    argument of spectrum(), etc.
## Not run: 
##D  # need signal package for this example
##D r <- rnorm(2048)
##D rh <- stats::filter(r, H)
##D rh <- rh[is.finite(rh)] # kludge to remove NA at start/end
##D sR <- spectrum(r, plot=FALSE, spans=c(11, 5, 3))
##D sRH <- spectrum(rh, plot=FALSE, spans=c(11, 5, 3))
##D par(mfrow=c(2, 1), mar=c(3, 3, 1, 1), mgp=c(2, 0.7, 0))
##D plot(sR$freq, sRH$spec/sR$spec, xlab="Frequency", ylab="Power Transfer",
##D      type='l', lwd=5, col='gray')
##D theory <- freqz(H, n=seq(0,pi,length.out=100))
##D # Note we must square the modulus for the power spectrum
##D lines(theory$f/pi/2, Mod(theory$h)^2, lwd=1, col='red')
##D grid()
##D legend("topright", col=c("gray", "red"), lwd=c(5, 1), cex=2/3,
##D        legend=c("Practical", "Theory"), bg="white")
##D plot(log10(sR$freq), log10(sRH$spec/sR$spec),
##D      xlab="log10 Frequency", ylab="log10 Power Transfer",
##D      type='l', lwd=5, col='gray')
##D theory <- freqz(H, n=seq(0,pi,length.out=100))
##D # Note we must square the modulus for the power spectrum
##D lines(log10(theory$f/pi/2), log10(Mod(theory$h)^2), lwd=1, col='red')
##D grid()
##D legend("topright", col=c("gray", "red"), lwd=c(5, 1), cex=2/3,
##D        legend=c("Practical", "Theory"), bg="white")
## End(Not run)



