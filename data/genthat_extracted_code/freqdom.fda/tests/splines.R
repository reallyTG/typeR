library("freqdom.fda")

## TEST spline basis
X = fts.rar(100)

SD = fts.spectral.density(X,q=20)
XI.est = fts.dpca.filters(SD)  # finds the optimal filter
Y.est = fts.dpca.scores(X, dpcs = XI.est)
fts.dpca.var(SD)
Xdpca.est = fts.dpca.KLexpansion(X, XI.est)

fts.plot.covariance(X)
fts.plot.operators(SD, freq=c(-0.2,0,0.45))

fts.plot.filters(XI.est, Ndpc = 3, lags = -2:2, lty = 1, lwd = 2, col= 1:3, one.plot = TRUE)
