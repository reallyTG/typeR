library("freqdom.fda")
data("pm10")

## Dynamic PCA ##
X = center.fd(pm10)
SD = fts.spectral.density(X,q=20)
XI.est = fts.dpca.filters(SD)  # finds the optimal filter
Y.est = fts.dpca.scores(X, dpcs = XI.est)
Xdpca.est = fts.dpca.KLexpansion(X, XI.est)
plot(Xdpca.est)

#X = fts.rar(100,d=11)
#fts.plot.operators(fts.cov.structure(X,lags=-2:2), cor = FALSE, grid = TRUE)
fts.plot.covariance(X, lags=-3:0)
fts.plot.operators(SD, freq=c(-0.2,0,0.45))

fts.plot.filters(XI.est, Ndpc = 3, lags = -1:1, lty = 1, lwd = 2, col= c(2,6,3), one.plot = TRUE)
