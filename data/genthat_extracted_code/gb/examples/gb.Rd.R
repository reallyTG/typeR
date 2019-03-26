library(gb)


### Name: gboot
### Title: Generalized bootstrapping
### Aliases: gboot
### Keywords: density models

### ** Examples


data(ofc)
X = ofc$x0
Ta = function(x) mean(x<31)
gld0 = fit.gld(X)
(out = gboot(X,gld0,statistic=Ta,R=100))
gld1 = fit.egld(X)
(out = gboot(X,gld1,statistic=Ta,R=100))




