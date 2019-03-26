library(urca)


### Name: ur.sp
### Title: Schmidt & Phillips Unit Root Test
### Aliases: ur.sp
### Keywords: regression

### ** Examples

data(nporg)
gnp <- na.omit(nporg[, "gnp.r"])
sp.gnp <- ur.sp(gnp, type="tau", pol.deg=1, signif=0.01)
summary(sp.gnp)



