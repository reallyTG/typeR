library(MNM)


### Name: plot.mvloc
### Title: Plotting Method for mvloc Objects
### Aliases: plot.mvloc
### Keywords: methods

### ** Examples

X <- rmvt(50, diag(c(1, 2)), 3)

est1 <- mv.1sample.est(X)
est2 <- mv.1sample.est(X, "sign")
est3 <- mv.1sample.est(X, "rank", "inner")

plot(est1)
plot(est1, est2, est3, X, alim="b", lty.ell=1:3, pch.ell=14:16)
plot(est1, est2, est3, X, alim="e")



