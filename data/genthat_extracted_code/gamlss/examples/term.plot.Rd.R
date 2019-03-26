library(gamlss)


### Name: term.plot
### Title: Plot regression terms for a specified parameter of a fitted
###   GAMLSS object
### Aliases: term.plot
### Keywords: regression

### ** Examples

data(aids)
a<-gamlss(y~pb(x)+qrt,data=aids,family=NBI)
term.plot(a, pages=1)
rm(a)



