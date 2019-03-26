library(stsm)


### Name: maxlik.td
### Title: Maximization of the Time Domain Likelihood Function
### Aliases: maxlik.td maxlik.td.optim maxlik.td.scoring
### Keywords: ts models nonlinear

### ** Examples

# replicate maximum likelihood procedure as implemented in 'stats::StructTS'
res0 <- stats::StructTS(log(AirPassengers), type = "BSM")
mairp <- stsm.model(model = "BSM", y = log(AirPassengers), 
  transPars = "StructTS")
res1 <- maxlik.td.optim(mairp, KF.version = "KFKSDS", 
  KF.args = list(P0cov = TRUE), method = "L-BFGS-B", gr = "numerical")
mairp1 <- set.pars(mairp, pmax(res1$par, .Machine$double.eps))
round(get.pars(mairp1), 6)
all.equal(get.pars(mairp1), res0$coef[c(4,1:3)], 
  tol = 1e-04, check.attributes = FALSE)

# smoothed components
ss1 <- char2numeric(mairp1, P0cov = TRUE)
kf1 <- KFKSDS::KF(mairp1@y, ss1)
ks1 <- KFKSDS::KS(mairp1@y, ss1, kf1)
plot(tsSmooth(res0)[,c(1,3)])
plot(ks1$ahat[,c(1,3)])

# the scoring algorithm reaches another local optimum where
# the seasonal component is more homoscedastic
mairp <- stsm.model(model = "BSM", y = log(AirPassengers), 
  transPars = NULL)
res2 <- maxlik.td.scoring(mairp, step = NULL, 
  ls = list(type = "optimize", tol = .Machine$double.eps^0.25, cap = 1),
  control = list(maxit = 100, tol = 0.001, trace = FALSE), debug = FALSE)
round(res2$par, 6)

mairp2 <- set.pars(mairp, res2$par)
ss2 <- char2numeric(mairp2, P0cov = FALSE)
kf2 <- KFKSDS::KF(mairp2@y, ss2)
ks2 <- KFKSDS::KS(mairp2@y, ss2, kf2)
plot(ks2$ahat[,c(1,3)])



