library(funData)


### Name: eFun
### Title: Generate orthonormal eigenfunctions
### Aliases: eFun

### ** Examples

oldPar <- par(no.readonly = TRUE)

argvals <- seq(0,1,0.01)

par(mfrow = c(3,2))
plot(eFun(argvals, M = 4, type = "Poly"), main = "Poly", ylim = c(-3,3))
plot(eFun(argvals, M = 4, ignoreDeg = 1:2, type = "PolyHigh"), main = "PolyHigh",  ylim = c(-3,3))
plot(eFun(argvals, M = 4, type = "Fourier"), main = "Fourier", ylim = c(-3,3))
plot(eFun(argvals, M = 4, type = "FourierLin"), main = "FourierLin", ylim = c(-3,3))
plot(eFun(argvals, M = 4, type = "Wiener"), main = "Wiener",  ylim = c(-3,3))
par(oldPar)



