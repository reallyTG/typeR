library(gamlss.dist)


### Name: GB1
### Title: The generalized Beta type 1 distribution for fitting a GAMLSS
### Aliases: GB1 dGB1 pGB1 qGB1 rGB1
### Keywords: distribution regression

### ** Examples

GB1()   # 
y<- rGB1(200, mu=.1, sigma=.6, nu=1, tau=4)
hist(y)
# library(gamlss)
# histDist(y, family=GB1, n.cyc=60)
curve(dGB1(x, mu=.1 ,sigma=.6, nu=1, tau=4), 0.01, 0.99, main = "The GB1  
           density mu=0.1, sigma=.6, nu=1, tau=4")




