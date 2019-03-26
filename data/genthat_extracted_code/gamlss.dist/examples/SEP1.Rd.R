library(gamlss.dist)


### Name: SEP1
### Title: The Skew Power exponential type 1-4 distribution for fitting a
###   GAMLSS
### Aliases: SEP1 dSEP1 pSEP1 qSEP1 rSEP1 SEP2 dSEP2 pSEP2 qSEP2 rSEP2 SEP3
###   dSEP3 pSEP3 qSEP3 rSEP3 SEP4 dSEP4 pSEP4 qSEP4 rSEP4
### Keywords: distribution regression

### ** Examples

SEP1() 
curve(dSEP4(x, mu=5 ,sigma=1, nu=2, tau=1.5), -2, 10, 
          main = "The SEP4  density mu=5 ,sigma=1, nu=1, tau=1.5")
# library(gamlss)
#y<- rSEP4(100, mu=5, sigma=1, nu=2, tau=1.5);hist(y)
#m1<-gamlss(y~1, family=SEP1, n.cyc=50)
#m2<-gamlss(y~1, family=SEP2, n.cyc=50)
#m3<-gamlss(y~1, family=SEP3, n.cyc=50)
#m4<-gamlss(y~1, family=SEP4, n.cyc=50) 
#GAIC(m1,m2,m3,m4)



