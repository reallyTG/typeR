library(dielectric)


### Name: epsAu
### Title: epsAu
### Aliases: epsAu

### ** Examples

require(dielectric) ; data(AuJC)
wvl <- seq(300, 900)
gold <- epsAu(wvl)

matplot(gold$wavelength, cbind(Re(gold$epsilon), Im(gold$epsilon)),
t="l", lty=1, xlab = "wavelength / nm", ylab = "Dielectric function")
matpoints(AuJC$wavelength, cbind(Re(AuJC$epsilon), Im(AuJC$epsilon)), pch=1)



