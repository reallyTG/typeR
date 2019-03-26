library(urca)


### Name: ur.pp
### Title: Phillips & Perron Unit Root Test
### Aliases: ur.pp
### Keywords: regression

### ** Examples

data(nporg)
gnp <- na.omit(nporg[, "gnp.r"])
pp.gnp <- ur.pp(gnp, type="Z-tau", model="trend", lags="short")
summary(pp.gnp)



