library(gamlss)


### Name: gamlss
### Title: Generalized Additive Models for Location Scale and Shape
### Aliases: gamlss is.gamlss gamlssNews
### Keywords: regression

### ** Examples
 
data(abdom)
mod<-gamlss(y~pb(x),sigma.fo=~pb(x),family=BCT, data=abdom, method=mixed(1,20))
plot(mod)
rm(mod)



