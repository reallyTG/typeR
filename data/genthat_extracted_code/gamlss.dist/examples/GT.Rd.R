library(gamlss.dist)


### Name: GT
### Title: The generalized t distribution for fitting a GAMLSS
### Aliases: GT dGT pGT qGT rGT
### Keywords: distribution regression

### ** Examples

GT()   # 
y<- rGT(200, mu=5, sigma=1, nu=1, tau=4)
hist(y)
curve(dGT(x, mu=5 ,sigma=2,nu=1, tau=4), -2, 11, 
      main = "The GT  density mu=5 ,sigma=1, nu=1, tau=4")
# library(gamlss)
# m1<-gamlss(y~1, family=GT) 



