library(gamlss)


### Name: centiles.split
### Title: Plots centile curves split by x for a GAMLSS object
### Aliases: centiles.split
### Keywords: regression

### ** Examples

data(abdom)
h<-gamlss(y~pb(x), sigma.formula=~pb(x), family=BCT, data=abdom) 
mout <- centiles.split(h,xvar=abdom$x)
mout
rm(h,mout)



