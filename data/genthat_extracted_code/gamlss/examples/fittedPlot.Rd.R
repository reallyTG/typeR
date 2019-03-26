library(gamlss)


### Name: fittedPlot
### Title: Plots The Fitted Values of a GAMLSS Model
### Aliases: fittedPlot
### Keywords: regression

### ** Examples

data(abdom)
h1<-gamlss(y~pb(x), sigma.formula=~x, family=BCT, data=abdom)
h2<-gamlss(y~pb(x), sigma.formula=~pb(x), family=BCT, data=abdom)
fittedPlot(h1,h2,x=abdom$x)
rm(h1,h2)



