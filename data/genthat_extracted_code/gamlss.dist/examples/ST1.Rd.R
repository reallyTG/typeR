library(gamlss.dist)


### Name: ST1
### Title: The skew t distributions, type 1 to 5
### Aliases: ST1 dST1 pST1 qST1 rST1 ST2 dST2 pST2 qST2 rST2 ST3 dST3 pST3
###   qST3 rST3 ST3C dST3C pST3C qST3C rST3C ST4 dST4 pST4 qST4 rST4 ST5
###   dST5 pST5 qST5 rST5 SST dSST pSST qSST rSST
### Keywords: distribution regression

### ** Examples
 
y<- rST5(200, mu=5, sigma=1, nu=.1)
hist(y)
curve(dST5(x, mu=30 ,sigma=5,nu=-1), -50, 50, main = "The ST5  density mu=30 ,sigma=5,nu=1")
# library(gamlss)
# m1<-gamlss(y~1, family=ST1)
# m2<-gamlss(y~1, family=ST2)
# m3<-gamlss(y~1, family=ST3)
# m4<-gamlss(y~1, family=ST4)
# m5<-gamlss(y~1, family=ST5) 
# GAIC(m1,m2,m3,m4,m5)



