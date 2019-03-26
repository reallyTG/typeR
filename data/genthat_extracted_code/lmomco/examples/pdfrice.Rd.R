library(lmomco)


### Name: pdfrice
### Title: Probability Density Function of the Rice Distribution
### Aliases: pdfrice
### Keywords: distribution probability density function Distribution: Rice

### ** Examples

lmr <- lmoms(c(10, 43, 27, 26, 49, 26, 62, 39, 51, 14))
rice <- parrice(lmr)
x <- quarice(nonexceeds(),rice)
plot(x,pdfrice(x,rice), type="b")


# For SNR=v/a > 24 or 240.001/10 > 24, the Normal distribution is
# used by the Rice as implemented here.
rice1 <- vec2par(c(239.9999,10), type="rice")
rice2 <- vec2par(c(240.0001,10), type="rice")
x <- 200:280
plot( x, pdfrice(x, rice1), type="l", lwd=5, lty=3) # still RICIAN code
lines(x, dnorm(  x, mean=240.0001, sd=10), lwd=3, col=2) # NORMAL obviously
lines(x, pdfrice(x, rice2), lwd=1, col=3) # NORMAL distribution code is triggered

# For SNR=v/a > 52 or 521/10 > 52, the Normal distribution
# used by the Rice as implemented here with simple parameter estimation
# because this high of SNR is beyond limits of Bessel function in Laguerre
# polynomial
rice1 <- vec2par(c(520,10), type="rice")
rice2 <- vec2par(c(521,10), type="rice")
x <- 10^(log10(520) - 0.05):10^(log10(520) + 0.05)
plot( x, pdfrice(x, rice1), type="l", lwd=5, lty=3)
lines(x, pdfrice(x, rice2), lwd=1, col=3) # NORMAL code triggered



