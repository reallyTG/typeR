library(gamlss)


### Name: coef.gamlss
### Title: Extract Model Coefficients in a GAMLSS fitted model
### Aliases: coef.gamlss
### Keywords: regression

### ** Examples

data(aids)
h<-gamlss(y~poly(x,3)+qrt, family=PO, data=aids) # 
coef(h)
rm(h)



