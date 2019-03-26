library(ReIns)


### Name: ScaleEPD
### Title: Bias-reduced scale estimator using EPD estimator
### Aliases: ScaleEPD

### ** Examples

data(secura)

# Hill estimator
H <- Hill(secura$size)
# EPD estimator
epd <- EPD(secura$size)

# Scale estimator
S <- Scale(secura$size, gamma=H$gamma, plot=FALSE)
# Bias-reduced scale estimator
Sepd <- ScaleEPD(secura$size, gamma=epd$gamma, kappa=epd$kappa, plot=FALSE)

# Plot logarithm of scale             
plot(S$k,log(S$A), xlab="k", ylab="log(Scale)", type="l")
lines(Sepd$k,log(Sepd$A), lty=2)



