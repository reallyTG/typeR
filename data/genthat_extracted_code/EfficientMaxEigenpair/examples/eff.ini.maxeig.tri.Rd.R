library(EfficientMaxEigenpair)


### Name: eff.ini.maxeig.tri
### Title: Tridiagonal matrix maximal eigenpair
### Aliases: eff.ini.maxeig.tri

### ** Examples

a = c(1:7)^2
b = c(1:7)^2
c = rep(0, length(a) + 1)
c[length(a) + 1] = 8^2
eff.ini.maxeig.tri(a, b, c, xi = 1)



