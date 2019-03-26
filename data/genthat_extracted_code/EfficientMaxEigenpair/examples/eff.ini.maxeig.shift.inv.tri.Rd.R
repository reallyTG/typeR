library(EfficientMaxEigenpair)


### Name: eff.ini.maxeig.shift.inv.tri
### Title: Tridiagonal matrix maximal eigenpair
### Aliases: eff.ini.maxeig.shift.inv.tri

### ** Examples

a = c(1:7)^2
b = c(1:7)^2
c = rep(0, length(a) + 1)
c[length(a) + 1] = 8^2
eff.ini.maxeig.shift.inv.tri(a, b, c, xi = 1)



