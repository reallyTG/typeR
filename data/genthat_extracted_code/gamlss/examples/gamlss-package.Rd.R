library(gamlss)


### Name: gamlss-package
### Title: Generalised Additive Models for Location Scale and Shape
### Aliases: gamlss-package
### Keywords: package

### ** Examples

data(abdom)
mod<-gamlss(y~pb(x),sigma.fo=~pb(x),family=BCT, data=abdom, method=mixed(1,20))
plot(mod)
rm(mod)



