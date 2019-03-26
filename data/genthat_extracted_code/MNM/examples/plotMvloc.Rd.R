library(MNM)


### Name: plotMvloc
### Title: Function to Plot Multivariate Location Estimates and Their
###   Confidence Ellipsoids.
### Aliases: plotMvloc
### Keywords: hplot

### ** Examples

X <- rmvt(50, diag(c(1, 2)), 3)

est1 <- mv.1sample.est(X)
est2 <- mv.1sample.est(X, "sign")
est3 <- mv.1sample.est(X, "rank", "inner")

plotMvloc(est1)
plotMvloc(est1, est2, est3, X, alim="b", lty.ell=1:3, pch.ell=14:16)
plotMvloc(est1, est2, est3, X, alim="e")



