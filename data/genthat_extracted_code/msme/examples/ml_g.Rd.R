library(msme)


### Name: ml_g
### Title: Function to fit linear regression using maximum likelihood.
### Aliases: ml_g
### Keywords: ~models

### ** Examples


data(ufc)
ufc <- na.omit(ufc)

ufc.g.reg <- ml_g(height.m ~ dbh.cm, data = ufc)

summary(ufc.g.reg)




