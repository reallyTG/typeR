library(DepthProc)


### Name: asymmetryCurve
### Title: Asymmetry curve based on depths
### Aliases: asymmetryCurve
### Keywords: asymmetry depth function multivariate nonparametric robust

### ** Examples


# EXAMPLE 1
library(sn)
xi <- c(0, 0)
alpha <- c(2, -5)
Omega <- diag(2) * 5

n <- 500
X <- mvrnorm(n, xi, Omega) # normal distribution
Y <- rmst(n, xi, Omega, alpha, nu = 1)
asymmetryCurve(X, Y, name = "NORM", name_y = "S_T(2, -5, 10)")

# EXAMPLE 2
data(under5.mort)
data(inf.mort)
data(maesles.imm)
data1990 <- cbind(under5.mort[, 1], inf.mort[, 1], maesles.imm[, 1])
data2011 <- cbind(under5.mort[, 22], inf.mort[, 22], maesles.imm[, 22])
as1990 <- asymmetryCurve(data1990, name = "scale curve 1990")
as2011 <- asymmetryCurve(data2011, name = "scale curve 2011")
figure <- getPlot(combineDepthCurves(as1990, as2011)) +
  ggtitle("Scale curves")
figure




