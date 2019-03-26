library(gamlss)


### Name: IC
### Title: Gives the GAIC for a GAMLSS Object
### Aliases: IC AIC.gamlss GAIC extractAIC.gamlss GAIC.table
### Keywords: regression

### ** Examples

data(abdom)
mod1<-gamlss(y~pb(x),sigma.fo=~pb(x),family=BCT, data=abdom)
IC(mod1)
mod2<-gamlss(y~pb(x),sigma.fo=~x,family=BCT, data=abdom)
AIC(mod1,mod2,k=3)
GAIC(mod1,mod2,k=3)
GAIC.table(mod1,mod2)
extractAIC(mod1,k=3)
rm(mod1,mod2)



