library(gamlss)


### Name: fitted.gamlss
### Title: Extract Fitted Values For A GAMLSS Model
### Aliases: fitted.gamlss fv
### Keywords: regression

### ** Examples

data(aids)
h<-gamlss(y~poly(x,3)+qrt, family=PO, data=aids) # 
fitted(h)
rm(h)



