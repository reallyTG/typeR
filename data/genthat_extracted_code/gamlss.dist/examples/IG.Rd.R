library(gamlss.dist)


### Name: IG
### Title: Inverse Gaussian distribution for fitting a GAMLSS
### Aliases: IG dIG pIG qIG rIG
### Keywords: distribution regression

### ** Examples

IG()# gives information about the default links for the normal distribution
# library(gamlss)
# data(rent)        
# gamlss(R~cs(Fl),family=IG, data=rent) # 
plot(function(x)dIG(x, mu=1,sigma=.5), 0.01, 6, 
 main = "{Inverse Gaussian  density mu=1,sigma=0.5}")
plot(function(x)pIG(x, mu=1,sigma=.5), 0.01, 6, 
 main = "{Inverse Gaussian  cdf mu=1,sigma=0.5}")



