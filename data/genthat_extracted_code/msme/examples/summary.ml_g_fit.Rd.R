library(msme)


### Name: summary.ml_g_fit
### Title: A summary method for objects of class ml_g_fit.
### Aliases: summary.ml_g_fit
### Keywords: ~models

### ** Examples


data(ufc)
ufc <- na.omit(ufc)

ufc.g.reg <- ml_g(height.m ~ dbh.cm, data = ufc)

summary(ufc.g.reg)




