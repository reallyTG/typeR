library(gamlss)


### Name: calibration
### Title: Calibrating centile curves
### Aliases: calibration
### Keywords: regression

### ** Examples

data(abdom)
m1<-gamlss(y~pb(x), sigma.fo=~pb(x), family=LO, data=abdom)
calibration(m1, xvar=abdom$x, fan=TRUE)



