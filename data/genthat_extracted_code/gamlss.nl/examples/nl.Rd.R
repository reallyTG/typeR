library(gamlss.nl)


### Name: nl
### Title: Functions to fit nonlinear additive models in GAMLSS
### Aliases: nl gamlss.nl nl.obj
### Keywords: regression

### ** Examples

data(la)
nlo<-nl.obj(formula=~bflow*(1-(1-exp(p1))*exp(-p2/bflow)), start=c(-.9, 90), data=la)
mod1<-gamlss(PET60~nl(nlo)-1, data=la ) 



