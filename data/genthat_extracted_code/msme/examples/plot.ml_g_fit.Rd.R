library(msme)


### Name: plot.ml_g_fit
### Title: A plot method for objects of class ml_g_fit.
### Aliases: plot.ml_g_fit
### Keywords: models htest

### ** Examples


data(ufc)
ufc <- na.omit(ufc)

ufc.g.reg <- ml_g(height.m ~ dbh.cm, data = ufc)

plot(ufc.g.reg)




