library(gamlss.mx)


### Name: dMX
### Title: Evaluate the d (pdf) and p (cdf) functions from GAMLSS mixtures
### Aliases: dMX pMX getpdfMX getpdfNP
### Keywords: distribution regression

### ** Examples

fyNO<-dMX(y=seq(0,3,.01), mu=list(1.253, 0.1876), sigma=list(exp(-0.6665 ), exp(-2.573 )),
                  pi=list(0.4079609, 0.5920391 ), family=list("NO","NO") )
plot(fyNO~seq(0,3,.01), type="l")                  
FyNO<-pMX(q=seq(0,3,.01), mu=list(1.253, 0.1876), sigma=list(exp(-0.6665 ), exp(-2.573 )),
                  pi=list(0.4079609, 0.5920391 ), family=list("NO","NO") )
plot(FyNO~seq(0,3,.01), type="l")  



