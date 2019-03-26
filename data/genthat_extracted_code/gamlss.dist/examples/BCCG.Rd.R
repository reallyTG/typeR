library(gamlss.dist)


### Name: BCCG
### Title: Box-Cox Cole and Green distribution (or Box-Cox normal) for
###   fitting a GAMLSS
### Aliases: BCCG BCCGuntr dBCCG pBCCG qBCCG rBCCG BCCGo pBCCGo qBCCGo
###   rBCCGo dBCCGo
### Keywords: distribution regression

### ** Examples

BCCG()   # gives information about the default links for the Cole and Green distribution 
# library(gamlss)
#data(abdom)
#h<-gamlss(y~cs(x,df=3), sigma.formula=~cs(x,1), family=BCCG, data=abdom) 
#plot(h)
plot(function(x) dBCCG(x, mu=5,sigma=.5,nu=-1), 0.0, 20, 
 main = "The BCCG  density mu=5,sigma=.5,nu=-1")
plot(function(x) pBCCG(x, mu=5,sigma=.5,nu=-1), 0.0, 20, 
 main = "The BCCG  cdf mu=5, sigma=.5, nu=-1")



