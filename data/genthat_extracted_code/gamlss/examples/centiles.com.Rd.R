library(gamlss)


### Name: centiles.com
### Title: Comparing centiles from different GAMLSS models
### Aliases: centiles.com
### Keywords: regression

### ** Examples

data(abdom)
h1<-gamlss(y~cs(x,df=3), sigma.formula=~cs(x,1),family=BCT, data=abdom)
h2<-gamlss(y~pb(x), sigma.formula=~pb(x), family=BCT, data=abdom )
centiles.com(h1,h2,xvar=abdom$x)
rm(h1,h2)



