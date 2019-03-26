library(gamlss.dist)


### Name: SIMPLEX
### Title: The simplex distribution for fitting a GAMLSS
### Aliases: SIMPLEX dSIMPLEX pSIMPLEX qSIMPLEX rSIMPLEX
### Keywords: distribution regression

### ** Examples

SIMPLEX()#  default links for the simplex distribution
plot(function(y) dSIMPLEX(y, mu=.5 ,sigma=1), 0.001, .999)
plot(function(y) pSIMPLEX(y, mu=.5 ,sigma=1), 0.001, 0.999)
plot(function(y) qSIMPLEX(y, mu=.5 ,sigma=1), 0.001, 0.999)
plot(function(y) qSIMPLEX(y, mu=.5 ,sigma=1, lower.tail=FALSE), 0.001, .999)



