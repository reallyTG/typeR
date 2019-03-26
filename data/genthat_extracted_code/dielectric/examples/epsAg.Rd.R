library(dielectric)


### Name: epsAg
### Title: epsAg
### Aliases: epsAg

### ** Examples

require(dielectric) ; data(AgPalik)
wvl <- seq(300, 900)
silver <- epsAg(wvl)

matplot(silver$wavelength, cbind(Re(silver$epsilon), Im(silver$epsilon)),
t="l", lty=1, xlab = "wavelength / nm", ylab = "Dielectric function")
matpoints(AgPalik$wavelength, cbind(Re(AgPalik$epsilon), Im(AgPalik$epsilon)), pch=1)



