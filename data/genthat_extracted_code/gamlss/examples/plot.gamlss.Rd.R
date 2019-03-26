library(gamlss)


### Name: plot.gamlss
### Title: Plot Residual Diagnostics for an GAMLSS Object
### Aliases: plot.gamlss
### Keywords: regression

### ** Examples


data(aids)
a<-gamlss(y~pb(x)+qrt,family=PO,data=aids)
plot(a)
rm(a)



