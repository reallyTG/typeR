library(urca)


### Name: ur.kpss
### Title: Kwiatkowski et al. Unit Root Test
### Aliases: ur.kpss
### Keywords: regression

### ** Examples

data(nporg)
gnp <- na.omit(nporg[, "gnp.r"])
gnp.l <- log(gnp)
kpss.gnp <- ur.kpss(gnp.l, type="tau", lags="short")
summary(kpss.gnp)



