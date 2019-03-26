library(gamlss.dist)


### Name: exGAUS
### Title: The ex-Gaussian distribution
### Aliases: exGAUS dexGAUS pexGAUS qexGAUS rexGAUS
### Keywords: distribution regression

### ** Examples

exGAUS()   # 
y<- rexGAUS(100, mu=300, nu=100, sigma=35)
hist(y)
# library(gamlss)
# m1<-gamlss(y~1, family=exGAUS) 
# plot(m1)
curve(dexGAUS(x, mu=300 ,sigma=35,nu=100), 100, 600, 
 main = "The ex-GAUS  density mu=300 ,sigma=35,nu=100")
plot(function(x) pexGAUS(x, mu=300,sigma=35,nu=100), 100, 600, 
 main = "The ex-GAUS  cdf mu=300, sigma=35, nu=100")



