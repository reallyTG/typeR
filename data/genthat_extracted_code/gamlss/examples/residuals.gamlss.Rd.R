library(gamlss)


### Name: residuals.gamlss
### Title: Extract Residuals from GAMLSS model
### Aliases: residuals.gamlss
### Keywords: regression

### ** Examples

data(aids)
h<-gamlss(y~poly(x,3)+qrt, family=NBI, data=aids) # 
plot(aids$x,resid(h))
plot(aids$x,resid(h,"sigma") )
rm(h)



